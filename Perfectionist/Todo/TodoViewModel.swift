//
//  TodoViewModel.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import Foundation
struct TodoModel:Equatable,Identifiable,Codable{
    var todoItem:String
    var id = UUID().uuidString
}

class TodoViewModel:ObservableObject{
    @Published var todoList:[TodoModel] = [
        TodoModel(todoItem: "Brush"),TodoModel(todoItem: "Bath"),TodoModel(todoItem: "Meditate"),TodoModel(todoItem: "Jog")
    ]{
        didSet{
            saveTODOs()
        }
    }
    
    init(){
        getTodoItems()
    }
    func getTodoItems(){
        guard let data = UserDefaults.standard.data(forKey: StaticUtility.todo) else { return }
        guard let savedData = try? JSONDecoder().decode([TodoModel].self, from: data) else { return }
        
        self.todoList = savedData
    }
    
    func removeItem(at indexSet:IndexSet){
        self.todoList.remove(atOffsets: indexSet)
    }
    
    func changeOrder(from CurrentIndexSet:IndexSet, to newIndex:Int){
        self.todoList.move(fromOffsets: CurrentIndexSet, toOffset: newIndex)
    }
    
    func saveTODOs(){
        if let encodedGroceryData = try? JSONEncoder().encode(todoList){
            UserDefaults.standard.set(encodedGroceryData, forKey: StaticUtility.todo)
        }
    }
}
