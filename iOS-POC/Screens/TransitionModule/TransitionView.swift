//  TransitionView.swift
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

class TransitionViewController:UIViewController {

    @IBOutlet weak var fromAccountLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var mobileOperatroLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var netAmountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var navView: UIView!
    
    // MARK: Properties
    var presenter:TransitionPresenterProtocol?
    var delegate:TransitionDelegate?
    
    var mobileTopup : MobileTopup?
    
    var amount:Double?
    var chooseOperator:String?
    var mobileNumber:String?
    var userDescription:String?
    var userAccount:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    func setup(){
        Utilities.setGradientBackground(view)
        Utilities.buttonBoder(confirmBtn)
        label()
    }
    
    func label() {
        fromAccountLabel.text = userAccount
        mobileNumberLabel.text = mobileNumber
        mobileOperatroLabel.text = chooseOperator
        amountLabel.text = String(amount ?? 0)
        discountLabel.text = String(mobileTopup?.DisAmount ?? 0)
        netAmountLabel.text = String(mobileTopup?.NetAmount ?? 0)
        descriptionLabel.text = userDescription
    }
     
    @IBAction func confirmTapped(_ sender: UIButton) {
        var disAmount = mobileTopup?.NetAmount
        presenter?.loadPopUpView(self, userAccount, mobileNumber, chooseOperator, amount,disAmount)
    }
    @IBAction func backTapped(_ sender: UIButton) {
        presenter?.loadHomeView(self)
    }
}

extension TransitionViewController: TransitionViewProtocol{
    
    func showError(_ message:String) {
        
    }
    
    func showBusy() {
        
    }
    
    func hideBusy() {
        
    }
    
}

