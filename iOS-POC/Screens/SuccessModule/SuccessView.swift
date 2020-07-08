//  SuccessView.swift
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

class SuccessViewController:UIViewController {
    
    var success : Success?
    var model = SuccessModel()
    
    @IBOutlet weak var transcationIDLabel: UILabel!
    @IBOutlet weak var fromAccoutLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var mobileOperatorLabel: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var discountAmountLabel: UILabel!
    @IBOutlet weak var successOneLabel: UILabel!
   
    @IBOutlet weak var okBtn: UIButton!
    

    // MARK: Properties
    var presenter:SuccessPresenterProtocol?
    var delegate:SuccessDelegate?
    
    var userAccount:String?
    var moobileNumber:String?
    var chooseOperator:String?
    var amount:Double?
    var discAmount:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup( )
        print(success)
        presenter?.viewDidLoad()
    }
    
    func setup( ){
        model.delegate = self
        model.getSuccess()
        Utilities.buttonBoder(okBtn)
        Utilities.setGradientBackground(view)
    }
    
    func label() {
        transcationIDLabel.text = success?.TransactionID
        fromAccoutLabel.text = userAccount
        mobileNumberLabel.text = moobileNumber
        mobileOperatorLabel.text = chooseOperator
        billAmountLabel.text = String(amount ?? 0)
        discountAmountLabel.text = String(discAmount ?? 0)
        successOneLabel.text = success?.RespDescription
    }
    
    @IBAction func okTapped(_ sender: UIButton) {
        
    }
    
}

extension SuccessViewController: SuccessModelProtocol {
    func successRetrieved(_ success: Success) {
        self.success = success
        label()
    }
    
    
}

extension SuccessViewController: SuccessViewProtocol{
    
    func showError(_ message:String) {
        
    }
    
    func showBusy() {
        
    }
    
    func hideBusy() {
        
    }
    
}

