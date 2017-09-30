//
//  AppReducer.swift
//  TodoList
//
//  Created by Leonardo Durazo on 29/09/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer {
    
    func handleAction(action: Action, state: AppState?) -> AppState {
        
        return AppState(todoState: TodoReducer().handleAction(action: action, state: state?.todoState))
    }
}
