//
//  Router.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import Foundation
import SwiftUI

enum RouteState:String{
    case todo = "TODO List"
    case grocery = "Grocery List"
    case scanner = "QR Scanner"
}
class Router{
    
    @ViewBuilder
    func route(to cell:String)->some View{
        if(cell == RouteState.todo.rawValue){
            TodoView()
        }else if(cell == RouteState.grocery.rawValue){
            GroceryView()
        }else if(cell == RouteState.scanner.rawValue){
//            Text("Scanner...")
//            QRScannerViewRepresentable()
            QRScannerView()
        }
    }
}
