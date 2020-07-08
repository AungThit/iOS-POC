//
//  MobileAccountTableViewCell.swift
//  iOS-POC
//
//  Created by AungThit on 06/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import UIKit

class MobileAccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var accountIDLabel: UILabel!
    
    @IBOutlet weak var viewBorder:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBorder.layer.borderWidth = 2
        viewBorder.layer.borderColor = UIColor.white.cgColor
        viewBorder.layer.cornerRadius = 10
        // Initialization code
    }
    
    func config(_ account:Account) {
        
        if account.AccountType == "SBA" {
            accountTypeLabel.text = "Saving Account"
        } else {
            accountTypeLabel.text = "Current Account"
        }
//        accountTypeLabel.text = account.AccountType
        accountIDLabel.text = account.AccountID
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
