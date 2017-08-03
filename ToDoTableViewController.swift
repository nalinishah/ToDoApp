//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by nalinis on 7/31/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import UIKit

@objc(ToDoTableViewController)class ToDoTableViewController: UITableViewController {

    //var toDoList = ToDoItem.getMockData()
    var toDoList = [ToDoItem]()
    var category : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ToDoTableViewCell", bundle: nil), forCellReuseIdentifier: "toDoCell")
        self.title =  self.category! + ": To-Do"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return toDoList.count;
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ToDoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoTableViewCell

        cell.toDoLabel?.text = toDoList[indexPath.row].title
        let accessory: UITableViewCellAccessoryType = toDoList[indexPath.row].done ? .checkmark : .none
        cell.accessoryType = accessory
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "segueToAddToDoItem", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene = segue.destination as! AddToDoViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "toDoCell", for: indexPath) as! ToDoTableViewCell
            nextScene.toDoItem = cell.toDoLabel?.text
        }
    }

    @IBAction func unwindToList(segue: UIStoryboardSegue){
        let source : AddToDoViewController = segue.source as! AddToDoViewController
        
        if (source.toDoItem != nil) {
            let item: String = (source.toDoItem)!
            self.toDoList.append(ToDoItem(title: item))
            self.tableView.reloadData()
        }
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if indexPath.row < toDoList.count {
                toDoList.remove(at: indexPath.row)           
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }    
    }
}
