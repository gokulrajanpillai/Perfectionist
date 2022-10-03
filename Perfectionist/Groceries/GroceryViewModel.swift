//
//  GroceryViewModel.swift
//  Perfectionist
//
//  Created by Harsh Yadav on 02/10/22.
//  Copyright © 2022 RAJAN. All rights reserved.
//

import Foundation
struct GroceryModel:Equatable,Identifiable,Codable{
    var groceryItem:String
    var id = UUID().uuidString
}

class GroceryViewModel:ObservableObject{
    @Published var groceryList:[GroceryModel] = [
        GroceryModel(groceryItem: "Bread"),GroceryModel(groceryItem: "Nutella"),GroceryModel(groceryItem: "Weizenmehi"),GroceryModel(groceryItem: "Cheese")
    ] {
        didSet{
            saveGrocery()
        }
    }
    init(){
        self.getGroceryData()
    }
    
    func getGroceryData(){
        guard let data = UserDefaults.standard.data(forKey: StaticUtility.grocery) else { return }
        guard let savedData = try? JSONDecoder().decode([GroceryModel].self, from: data) else { return }
        
        self.groceryList = savedData
    }
    
    func removeItem(at indexSet:IndexSet){
        self.groceryList.remove(atOffsets: indexSet)
    }
    
    func changeOrder(from CurrentIndexSet:IndexSet, to newIndex:Int){
        self.groceryList.move(fromOffsets: CurrentIndexSet, toOffset: newIndex)
    }
    
    func saveGrocery(){
        if let encodedGroceryData = try? JSONEncoder().encode(groceryList){
            UserDefaults.standard.set(encodedGroceryData, forKey: StaticUtility.grocery)
        }
    }
}

struct StaticUtility{
    static var grocery:String = "GroceryItems.InsanelyHarsh"
    static var todo:String = "TODOItems.InsanelyHarsh"
}
