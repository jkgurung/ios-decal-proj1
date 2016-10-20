//
//  ToDoTableTableViewController.swift
//  toDoAppsWithCoreData
//
//  Created by Jhalak Gurung on 10/19/16.
//  Copyright © 2016 Jhalak Gurung. All rights reserved.
//

import UIKit


class ToDoTableTableViewController: UITableViewController {
    
    var toDolist = [ToDoList]()
    var completedTask = 0
    
    func update() {
        checkIfDone()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get the data from core data 
        getData()
        //reload the tableview
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDolist.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Configure the cell...
        
        let task = toDolist[indexPath.row]
        cell.textLabel?.text = "  ⃝  \(task.text!)"
        cell.accessoryType = toDolist[indexPath.row].isCompleted ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == UITableViewCellAccessoryType.none {
            cell?.accessoryType = .checkmark
            toDolist[indexPath.row].isCompleted = true
            toDolist[indexPath.row].timer = Date() as NSDate?
        } else {
            cell?.accessoryType = .none
            toDolist[indexPath.row].isCompleted = false
            toDolist[indexPath.row].timer = nil
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            try toDolist = context.fetch(ToDoList.fetchRequest())
        } catch {
            print("error")
        }
    }
    
    func checkIfDone() {
        getData()
        completedTask = 0
        for task in toDolist {
            if task.isCompleted {
                completedTask += 1
            }
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            // Delete the row from the data source
            let task = toDolist[indexPath.row]
            context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                try toDolist = context.fetch(ToDoList.fetchRequest())
            } catch {
                print("error")
            }
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //Everytime you segue, you will call the prepare function
    //In this prepare function, you can pass your data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Stats" {
            let svc = segue.destination as! StatsViewController
            checkIfDone()
            svc.label = String(completedTask)

        }
    }

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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
