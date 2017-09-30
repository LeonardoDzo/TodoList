//
//  AppState.swift
//  TodoList
//
//  Created by Leonardo Durazo on 29/09/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import Foundation
import ReSwift

struct AppState: StateType{
    var todoState : todoState
}
enum Result<T> {
    case loading
    case failed
    case Failed(T)
    case finished
    case Finished(T)
    case noFamilies
    case none
}

struct todoState {
    var todoList : Result<Any>!
}
