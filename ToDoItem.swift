//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by nalinis on 7/31/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import Foundation

class ToDoItem {
    var title : String
    var done: Bool
    
    public init(title: String) {
        self.title = title
        self.done = false
    }
}
