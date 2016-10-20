//
//  StatsViewController.swift
//  toDoAppsWithCoreData
//
//  Created by Jhalak Gurung on 10/19/16.
//  Copyright © 2016 Jhalak Gurung. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    
    @IBOutlet weak var completeTask: UILabel!
    
    var label = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        completeTask.text = label
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
