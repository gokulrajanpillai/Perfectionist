//
//  GroceryView.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import SwiftUI

struct GroceryView: View {
    @ObservedObject var groceryVM:GroceryViewModel = GroceryViewModel()
//    @Binding var groceryItems:[GroceryModel]
//    @Binding var vm:GroceryViewModel
    @State var groceryItem:String = ""
    @State var isTapped:Bool = false
    var body: some View {
        VStack{
            List{
                ForEach($groceryVM.groceryList,id:\.id) { $data in
                    TextField("Grocery Item", text: $data.groceryItem)
                }
                .onDelete { indexSet in
                    self.groceryVM.removeItem(at: indexSet)
                }
                .onMove { indexSet, index in
                    self.groceryVM.changeOrder(from: indexSet, to: index)
                }
            }
            
            Spacer()
            
            
            Button {
                withAnimation {
                    self.groceryVM.groceryList.append(GroceryModel(groceryItem: "New things to do"))
                }
            } label: {
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("ADD")
                }.padding()
            }

        }
        .toolbar {
            EditButton()
        }
    }
}

struct GroceryView_Previews: PreviewProvider {
    static var previews: some View {
//        GroceryView(vm: .constant(GroceryViewModel()))
        GroceryView()
    }
}
