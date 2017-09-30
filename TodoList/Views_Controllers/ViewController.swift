//
//  ViewController.swift
//  TodoList
//
//  Created by Leonardo Durazo on 28/09/17.
//  Copyright © 2017 Leonardo Durazo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var todolist = [Todo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        let todo = todolist[indexPath.row]
        cell.bind(todo)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Eliminar") { action, index in
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.todolist.remove(at: indexPath.row)
        }
        
        
        return [delete]
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
extension ViewController {
    func setupNavBar() -> Void {
        let addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.add))
        self.navigationItem.rightBarButtonItem = addBtn
    }
    
    @objc func add() -> Void {
        let alertController = UIAlertController(title: "Agregar tarea", message: "", preferredStyle: .alert)
        var _todo : Todo!
        let saveAction = UIAlertAction(title: "Guardar", style: .default, handler: {
            alert -> Void in
            
            let titleTextField = alertController.textFields![0] as UITextField
            guard let title = titleTextField.text, !title.isEmpty, (titleTextField.text?.characters.count)! > 4 else {
                return
            }
            _todo = Todo()
            _todo.title = title
            if _todo != nil {
                self.todolist.append(_todo)
                self.tableView.insertRows(at: [IndexPath(row: self.todolist.count-1, section: 0)], with: .fade)
            }
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Nombre de la tarea?"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

