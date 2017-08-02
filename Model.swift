//
//  Model.swift
//  ToDoApp
//
//  Created by nalinis on 7/31/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import Foundation

class Model {
    
    private var categoryItemList = CategoryItem.getMockData()
    private var categories : [CategoryItem] = [CategoryItem]()
    
    var CategoryItems : [CategoryItem] {
        return categories
    }
    
    init() {
        for categoryItem in categoryItemList {
            categories.append(categoryItem)
        }
    }
}
