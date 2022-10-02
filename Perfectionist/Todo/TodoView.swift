//
//  TodoView.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import SwiftUI

struct TodoView: View {
    @ObservedObject var todoVM:TodoViewModel = TodoViewModel()
    var body: some View {
        VStack{
            List{
                ForEach($todoVM.todoList,id:\.id) { $data in
                    TextField("TODO Item", text: $data.todoItem)
                        .onChange(of: data) { newValue in
                            print("changed")
                        }
                }
                .onDelete { indexSet in
                    self.todoVM.removeItem(at: indexSet)
                }
                .onMove { indexSet, index in
                    self.todoVM.changeOrder(from: indexSet, to: index)
                }
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    self.todoVM.todoList.append(TodoModel(todoItem: "New things to do"))
                }
            } label: {
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("ADD")
                }
            }

        }
        .toolbar {
            EditButton()
        }
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        DailyLifeView()
    }
}
