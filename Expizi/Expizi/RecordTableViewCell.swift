//
//  RecordTableViewCell.swift
//  Expizi
//
//  Created by ADITYA M NAIK on 2022-04-10.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var isIncome: UILabel!
    
    @IBOutlet weak var AmountL: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
