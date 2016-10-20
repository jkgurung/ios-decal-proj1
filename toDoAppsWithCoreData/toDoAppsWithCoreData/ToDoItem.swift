//
//  ToDoItem.swift
//  toDoAppsWithCoreData
//
//  Created by Jhalak Gurung on 10/19/16.
//  Copyright © 2016 Jhalak Gurung. All rights reserved.
//

import Foundation


class ToDoItem {
    // A text description of this item.
    var text: String
    
    // A Boolean value that determines the completed state of this item.
    var completed: Bool
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String) {
        self.text = text
        self.completed = false
    }
}
