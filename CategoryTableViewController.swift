//
//  CategoryTableViewController.swift
//  ToDoApp
//
//  Created by nalinis on 7/31/17.
//  Copyright © 2017 nalinis. All rights reserved.
//

import UIKit

class CategoryTableViewController: UITableViewController {

    //var categoryItemList = CategoryItem.getMockData()
    var categoryItems: [CategoryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
    
        tableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "categoryCell")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(CategoryTableViewController.didTapAddItemButton(_:)))
        let model = Model.init()
        categoryItems = model.CategoryItems
    }

    func didTapAddItemButton(_ sender: UIBarButtonItem) {
        let addAlert = UIAlertController(title: "Add new category", message: "Add new category", preferredStyle: .alert)
        
        addAlert.addTextField(configurationHandler: nil)
        
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        addAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            if let title = addAlert.textFields?[0].text {
                if !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    self.addNewCategory(title:title)
                }
            }
        }))
        
        self.present(addAlert, animated: true, completion: nil)
        
    }
    
    func addNewCategory(title: String) {
        let newIndex = categoryItems.count
        categoryItems.append(CategoryItem(title: title, withToDo: []))
        tableView.insertRows(at: [IndexPath(row:newIndex, section:0)], with: .top)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return categoryItems.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToToDo", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CategoryTableViewCell =  tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell

        cell.categoryLabel?.text = categoryItems[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene = segue.destination as! ToDoTableViewController
        let indexPath = tableView.indexPathForSelectedRow
        nextScene.toDoList = categoryItems[(indexPath?.row)!].todoItems
        nextScene.category = categoryItems[(indexPath?.row)!].title
    }
}
