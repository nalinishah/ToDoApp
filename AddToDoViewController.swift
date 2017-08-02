//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by nalinis on 7/31/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
 
    
    var toDoItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField?.text = toDoItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender as? NSObject != self.saveButton {
            return
        }
        
        if (self.textField.text?.characters.count)! > 0 {
            self.toDoItem = self.textField.text!
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
