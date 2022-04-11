//
//  RecordScreenViewController.swift
//  Expizi
//
//  Created by ADITYA M NAIK on 2022-04-10.
//

import UIKit

class RecordScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var incomeType = "Income"
    var expenses: [Expenses] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! RecordTableViewCell
        let exp =  expenses[indexPath.row]
        
        if(!exp.isIncome){
            incomeType = "Expense"
        }
        cell.isIncome.text = incomeType
        cell.categoryLabel.text = exp.category
        cell.AmountL.text = String(exp.amount)
    
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    

    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let jsonDecoder = JSONDecoder()
        var allExpenses = "[]"
        
        let preferences = UserDefaults.standard
        let key = "allExpenses"
        if preferences.object(forKey: key) == nil {
            //  Doesn't exist
        } else {
            allExpenses = preferences.string(forKey: key)!
        }
        do{
            expenses = try jsonDecoder.decode([Expenses].self, from: allExpenses.data(using: .utf8)!)
            
        }catch{
            print("Error getting data")
        }
        
     
        
        
        
        self.tableView.delegate = self

        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
