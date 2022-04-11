//
//  ExpensesViewController.swift
//  Expizi
//
//  Created by ADITYA M NAIK on 2022-04-10.
//

import UIKit

class ExpensesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var categoryOutlet: UIButton!
    
    @IBAction func categoryAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var isIncomeToggle: UISwitch!
    
    @IBOutlet weak var amountOutlet: UITextField!
    
    @IBAction func expenseSaveButton(_ sender: Any) {
        let expenses = Expenses(category: categoryOutlet.titleLabel!.text!, amount: Double(amountOutlet.text!)!, isIncome: isIncomeToggle.isOn)

        do{
            let jsonDecoder = JSONDecoder()
            let jsonEncoder = JSONEncoder()
            var allExpenses = "[]"
            
            let preferences = UserDefaults.standard
            let key = "allExpenses"
            let totalKey = "totalExpense"

            if preferences.object(forKey: key) == nil {
                //  Doesn't exist
            } else {
                allExpenses = preferences.string(forKey: key)!
            }
            
            var expenseList: [Expenses] = try jsonDecoder.decode([Expenses].self, from: allExpenses.data(using: .utf8)!)
            expenseList.append(expenses)
            var total = 0.0
            expenseList.forEach { exp in
                if(exp.isIncome){
                    total += exp.amount
                }else{
                    total -= exp.amount
                }
            }
            preferences.set(total, forKey: totalKey)

            

            
        let jsonData = try jsonEncoder.encode(expenseList)
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
            //Save in preference
            
            preferences.set(json, forKey: key)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)){
                        self.navigationController?.popToRootViewController(animated: true)
                    }
            showToast(message: "Saved Successfully")
            

            
        }
        catch{
            print("Exception while saving")
        }

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
