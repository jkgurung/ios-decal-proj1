//
//  addTaskViewController.swift
//  toDoAppsWithCoreData
//
//  Created by Jhalak Gurung on 10/19/16.
//  Copyright © 2016 Jhalak Gurung. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DonePressed(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = ToDoList(context: context)
        if let text = textField.text {
            task.text = text
            task.isCompleted = false
            //Save the data to coreData
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        
        //back to tableViewController
        navigationController!.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
