//
//  Category.swift
//  ToDoApp
//
//  Created by nalinis on 7/31/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import Foundation

class CategoryItem {
    var title: String
    var todoItems = [ToDoItem]()
    
    public init(title: String, withToDo: [ToDoItem]) {
        self.title = title
        self.todoItems = withToDo
    }
}

/*
class CategoryItem {
    var title: String
    
    public init(title: String) {
        self.title = title
    }
}*/

extension CategoryItem {
    public class func getMockData() -> [CategoryItem] {
        return [
            CategoryItem(title: "School", withToDo: [ToDoItem(title: "Sharpeners"),
                                                        ToDoItem(title: "Erasers"),
                                                        ToDoItem(title: "Pencils")]),
            CategoryItem(title: "Groceries", withToDo: [ToDoItem(title: "Shampoo"),
                                                      ToDoItem(title: "Conditioner"),
                                                      ToDoItem(title: "Soap")]),
            CategoryItem(title: "Household", withToDo: [ToDoItem(title: "Organize"),
                                               ToDoItem(title: "Take trash out"),
                                               ToDoItem(title: "Clean!")])
    ]
    }
}
