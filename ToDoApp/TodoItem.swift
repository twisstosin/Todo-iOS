//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Tosin Omotoyinbo on 8/20/18.
//  Copyright © 2018 Tosin Omotoyinbo. All rights reserved.
//

import Foundation

struct TodoItem : Codable {
    
    var title:String
    var completed:Bool
    var createdAt:Date
    var itemIdentifier:UUID
    
    func saveItem() {
        DataManager.save(object: self, with: itemIdentifier.uuidString)
    }
    
    func deleteItem() {
        DataManager.delete(itemIdentifier.uuidString)
    }
    
    mutating func markAsCompleted() {
        
        self.completed = true
        
        DataManager.save(object: self, with: itemIdentifier.uuidString)
    }
}
