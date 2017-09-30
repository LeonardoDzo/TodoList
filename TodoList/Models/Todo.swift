//
//  Todo.swift
//  TodoList
//
//  Created by Leonardo Durazo on 29/09/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import UIKit

struct Todo : Codable{
    typealias td = Todo
    static let kid = "id"
    static let ktitle = "title"
    static let kpriority = "priority"
    static let kcompleted = "completed"
    
    var title: String
    var id: Int?
    var completed = false
    var priority: Int
    
    init() {
        title = ""
        id = 0
        priority = 0
    }
    
    init?(json: [String: Any]) {
        guard let title = json[td.ktitle] as? String,
            let id = json[td.kid] as? Int,
            let priority = json[td.kpriority] as? Int,
            let completed = json[td.kcompleted] as? Bool else {
                return nil
        }
        
        self.title = title
        self.priority = priority
        self.completed = completed
        self.id = id
    }
}
enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

protocol TodoBindeable: AnyObject {
    var todo : Todo! {get set}
    var titleLabel: UILabel! {get}
    var completedSwitch: UISwitch! {get}
}

extension TodoBindeable {
    var titleLabel: UILabel! {return nil}
    var completedSwitch: UISwitch! {return nil}
    
    func bind(_ todo: Todo) -> Void {
        self.todo = todo
        bind()
    }
    func bind() -> Void {
        guard let todo = self.todo else {
            return
        }
        if let titleLabel = self.titleLabel {
            titleLabel.text = todo.title
        }
        if let completedSwitch = self.completedSwitch {
            completedSwitch.isOn = todo.completed
        }
    }
}

