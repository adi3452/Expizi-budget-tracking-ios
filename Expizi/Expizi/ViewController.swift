//
//  ViewController.swift
//  Expizi
//
//  Created by ADITYA M NAIK on 2022-03-13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalExpenseL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var total = 0.0
        
        let preferences = UserDefaults.standard
        let key = "totalExpense"
        if preferences.object(forKey: key) == nil {
            //  Doesn't exist
        } else {
            total = preferences.double(forKey: key)
        }
        
        totalExpenseL.text = String(total)
    }


}

