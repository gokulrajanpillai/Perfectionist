//
//  CustomCellView.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import SwiftUI

struct CustomCellView: View {
    var imageName:String
    var cellTitle:String
    var body: some View {
        VStack(alignment: .leading){
            Image("\(imageName)")
                .resizable()
                .frame(height: 180)
                .cornerRadius(10)
            Text("\(cellTitle)")
        }.padding()
    }
}

struct CustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCellView(imageName: "todoList", cellTitle: "TODO List")
    }
}
