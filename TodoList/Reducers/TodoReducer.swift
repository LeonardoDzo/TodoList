//
//  TodoReducer.swift
//  TodoList
//
//  Created by Leonardo Durazo on 29/09/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import Foundation
import ReSwift
struct TodoReducer  {
    func handleAction(action: Action, state: todoState?) -> todoState {
        
        let state = state ?? todoState(todoList: .none)
        
        return state
    }
}

