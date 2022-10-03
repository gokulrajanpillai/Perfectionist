//
//  DailyLifeViewModel.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import Foundation
import SwiftUI
struct CellModel:Identifiable,Hashable{
    var cellTitle:String
    var image:String
    var id = UUID().uuidString
}

class DailyLifeViewModel:ObservableObject{
    @Published var cellData:[CellModel] = [CellModel(cellTitle: RouteState.todo.rawValue, image: "todoList"),
                                           CellModel(cellTitle: RouteState.grocery.rawValue, image: "groceryList"),
                                           CellModel(cellTitle: RouteState.scanner.rawValue, image: "qrCode")]
    
    let router:Router = Router()
    
    
    @ViewBuilder
    func push(to cellTitle:String)->some View{
        self.router.route(to: cellTitle)
    }
}
