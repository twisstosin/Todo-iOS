//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by Tosin Omotoyinbo on 10/31/18.
//  Copyright © 2018 Tosin Omotoyinbo. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var todoItems:[TodoItem]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        loadData()
    }
    
    @IBAction func addNewTodo(_ sender: Any) {
        let addAlert = UIAlertController(title: "New Todo", message: "Enter a Title", preferredStyle: .alert)
        
        addAlert.addTextField { (textfield : UITextField) in
            textfield.placeholder = "ToDo Item Title"
        }
        
        
        addAlert.addAction(UIAlertAction(title: "Create", style: .default, handler:
            {(action:UIAlertAction) in
            
                guard let title = addAlert.textFields?.first?.text else { return }
                let newTodo = TodoItem.init(title: title, completed: false, createdAt: Date(), itemIdentifier: UUID())
                newTodo.saveItem()
                
                self.todoItems.append(newTodo)
                
                let indexPath = IndexPath(row: self.tableView.numberOfRows(inSection: 0), section: 0)
                self.tableView.insertRows(at: [indexPath], with: .automatic)
        }))
        
        
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(addAlert, animated: true,completion: nil)
        
    }
    func loadData() {
        todoItems = [TodoItem]()
        todoItems = DataManager.loadAll(TodoItem.self).sorted(by: {
            $0.createdAt < $1.createdAt
        })
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoTableViewCell
        
        let todoItem = todoItems[indexPath.row]
        
        cell.todoLabel.text = todoItem.title

         //Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
