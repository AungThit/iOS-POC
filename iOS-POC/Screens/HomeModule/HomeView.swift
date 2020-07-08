//  HomeView.swift
/*------------------------------------------------------------------------------
 
 This source is part of the Tech Plus Solution Co., Ltd.
 Copyright  2018-2019, Tech Plus Solution and/or its affiliates. All rights reserved.
 
 No part of this work may be reproduced, stored in a retrieval system,
 adopted or transmitted in any form or by any means, electronic, mechanical,
 photographic, graphic, optic recording or otherwise, translated in any language
 or computer language, without the prior written permission of Tech Plus Solution and/or its affiliates.
 
 Tech Plus Solution Co., Ltd.
 Myittar Nyunt, Tamwe Township,
 Yangon,
 Myanmar.
 
 Modification History
 
 Date        Version        Author               Description
 ----------  -----------    ---------------      ----------------------------------------
 <#Date DD/MM/YYYY#>  <#1.0#>            <#Your Name#>        Initial Version
 
 
 ------------------------------------------------------------------------------*/
import Foundation
import UIKit

class HomeViewController:UIViewController {
    
    var account = [Account]()
    var selectAccount : Account?
    
    @IBOutlet weak var requireAccountLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var accountDataLabel: UILabel!
    @IBOutlet weak var avaliableBalanceLabel: UILabel!
    @IBOutlet weak var avaliableBalanceDataLabel: UILabel!
    @IBOutlet weak var requireMobileNumberLabel: UILabel!
    @IBOutlet weak var chooseOneOperatorLabel: UILabel!
    @IBOutlet weak var requireAmountLabel: UILabel!
    @IBOutlet weak var textviewCountLabel: UILabel!
    
    @IBOutlet weak var accountBtn: UIButton!
    @IBOutlet weak var mobileNumberBtn: UIButton!
    @IBOutlet var mobileOperatorBtn: [UIButton]!
    @IBOutlet var amountBtn: [UIButton]!
    @IBOutlet weak var mobileTopupBtn: UIButton!
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet var operatorView: [UIView]!
    @IBOutlet weak var snipper: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter:HomePresenterProtocol?
    var delegate:HomeDelegate?
    
    
    var mobileDescription: String = ""
    var mobileOperator:String = ""
    
    var amount:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(account)
        setup( )
        presenter?.viewDidLoad()
    }
    
    func setup( ){
        hideLabel()
        buttons(amountBtn)
        views(operatorView)
        Utilities.buttonBoder(mobileTopupBtn)
        Utilities.setGradientBackground(view)
        descriptionTextView.layer.cornerRadius = 5
        textviewCountLabel.text = "/ 50"
        snipper.isHidden = true
    }
    
    func hideLabel() {
        chooseOneOperatorLabel.isHidden = true
        requireMobileNumberLabel.isHidden = true
        requireAccountLabel.isHidden = true
        requireAmountLabel.isHidden = true
        accountLabel.isHidden = true
        accountDataLabel.isHidden = true
        avaliableBalanceLabel.isHidden = true
        avaliableBalanceDataLabel.isHidden = true
    }
    
    func buttons(_ buttons:[UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.backgroundColor = .none
            button.setTitleColor(UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0), for: .normal)
        }
    }
    func views(_ views:[UIView]) {
        for view in views {
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.white.cgColor
            view.layer.cornerRadius = 5
    }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectAccount = selectAccount {
            hideLabel()
            avaliableBalanceLabel.isHidden = false
            avaliableBalanceDataLabel.isHidden = false
            accountLabel.isHidden = false
            accountDataLabel.isHidden = false
            accountTextField.text = selectAccount.AccountID
            avaliableBalanceDataLabel.text = selectAccount.AvailableBal
            
            if selectAccount.AccountType == "SBA" {
                accountDataLabel.text = "Saving Account"
            } else {
                accountDataLabel.text = "Current Account"
            }
        }
    }
    
    @IBAction func mobileOperatorTapped(_ sender: UIButton) {
        buttons(mobileOperatorBtn)
        switch sender.tag {
        case 100:
            operatorSelectBtn(sender)
            mobileOperator = "ooredoo"
        case 200:
            operatorSelectBtn(sender)
            mobileOperator = "telenor"
        case 300:
            operatorSelectBtn(sender)
            mobileOperator = "mytel"
        case 400:
            operatorSelectBtn(sender)
            mobileOperator = "MPT"
        case 500:
            operatorSelectBtn(sender)
            mobileOperator = "MECTEL"
        default:
            break
        }
        
        getOperator(mobileOperator)
    }
    
    func operatorSelectBtn(_ buttton:UIButton) {
        buttton.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.7)
       
    }
    
    func selectBtn(_ button:UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 2.0/255.0, green: 1.0/255.0, blue: 96.0/255.0, alpha: 1.0), for: .normal)
    }
    
    @IBAction func amountTapped(_ sender: UIButton) {
        buttons(amountBtn)
        switch sender.tag {
        case 1000:
            selectBtn(sender)
            if sender.isSelected == true{
                amount! -= amount!
            } else {
                amount = 1000
            }
        case 2000:
            selectBtn(sender)
            if sender.isSelected == true {
                amount! -= amount!
            } else {
                amount = 2000
            }
        case 3000:
            selectBtn(sender)
            if sender.isSelected == true {
                amount! -= amount!
            } else {
            amount = 3000
            }
        case 4000:
            selectBtn(sender)
            if sender.isSelected == true {
                amount! -= amount!
            } else {
            amount = 4000
            }
        case 5000:
            selectBtn(sender)
            if sender.isSelected == true {
                amount! -= amount!
            } else {
            amount = 5000
            }
        case 10000:
            selectBtn(sender)
            if sender.isSelected == true {
                amount! -= amount!
            } else {
            amount = 10000
            }
        default:
            sender.backgroundColor = .none
        }
        //        var realAmount = amount
        
        getAmount(amount!)
    }
    @IBAction func mobileTopupTapped(_ sender: UIButton) {
        mobileTopupValidation(accountTextField.text, mobileNumberTextField.text)
    }
    
    @IBAction func userAccountTapped(_ sender: UIButton) {
        presenter?.PostAccount(account)
        
    }
    
    func mobileTopupValidation(_ account:String?,_ mobileNumber:String?) {
        presenter?.checkVerilation(account,mobileNumber)
        if let account = account, account.count != 0,let mobileNumber = mobileNumber, mobileNumber.count != 0 {

            getMobileNumber()
        }
    }
    
    func getAmount(_ amount:Double) {
        presenter?.postAmount(amount)
    }
    
    func getOperator(_ chooseOperator:String) {
        presenter?.postOperator(chooseOperator)
    }
    
    func getMobileNumber() {
        let mobileNumber = mobileNumberTextField.text
        let userDescription = descriptionTextView.text
        let userID = selectAccount?.AccountID
        presenter?.postData(mobileNumber, userID ?? "", userDescription ?? "")
        
    }
    
    func buttonPressed() {
    
    }
    
}

extension HomeViewController:UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        textviewCountLabel.text = "\(descriptionTextView.text.count) / 50"
        return textView.text.count + (text.count - range.length) <= 50
        
    }
}

extension HomeViewController:HomeDelegate {
    func passData(_ account: Account) {
        selectAccount = account
        
    }
    
}

extension HomeViewController: HomeViewProtocol{
    
    func showError(_ message:String) {
        
    }
    
    func showBusy() {
        
    }
    
    func hideBusy() {
        snipper.isHidden = true
        snipper.stopAnimating()
    }
    
    func showRequireAccountError() {
        requireAccountLabel.isHidden = false
    }
    
    func showRequireMobileNumberError() {
        requireMobileNumberLabel.isHidden = false
    }
    
    func showChooseOneOperatorError() {
        chooseOneOperatorLabel.isHidden = false
    }
    
    func showRequireAmountError() {
        requireAmountLabel.isHidden = false
    }
    
    func hideRequireAccountError() {
        requireAccountLabel.isHidden = true
    }
    
    func hideRequireMobileNumberError() {
        requireMobileNumberLabel.isHidden = true
    }
    
    func hideChooseOneOperatorError() {
        chooseOneOperatorLabel.isHidden = true
    }
    
    func hideRequireAmountError() {
        requireAmountLabel.isHidden = true
    }
    
    func showAccountData() {
        accountLabel.isHidden = false
        accountDataLabel.isHidden = false
        avaliableBalanceLabel.isHidden = false
        avaliableBalanceDataLabel.isHidden = false
    }
    
}

