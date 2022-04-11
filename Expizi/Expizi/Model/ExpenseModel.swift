//
//  ExpenseModel.swift
//  Expizi
//
//  Created by ADITYA M NAIK on 2022-04-10.
//

import Foundation



struct Expenses: Codable{
    var category:String
    var amount:Double
    var isIncome:Bool
}

