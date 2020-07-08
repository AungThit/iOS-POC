//  PopUpView.swift
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

class PopUpViewController:UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    @IBOutlet weak var popUpView: UIView!
    // MARK: Properties
    var presenter:PopUpPresenterProtocol?
    var delegate:PopUpDelegate?
    
    var amount:Double?
    var mobileNumber:String?
    var chooseOperator:String?
    var userAccount:String?
    var dicAmount:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup( )
        presenter?.viewDidLoad()
    }
    
    func setup( ){
        buttonRadius(cancelBtn)
        buttonRadius(okBtn)
        viewRadius(popUpView)
    }
    
    func buttonRadius(_ button:UIButton) {
        button.layer.cornerRadius = 10
    }
    
    func viewRadius(_ view:UIView) {
        view.layer.cornerRadius = 20
    }
    
    @IBAction func okTapped(_ sender: UIButton) {
        if let password = passwordTextField.text , password.count != 0{
            presenter?.loadSuccessView(self, userAccount, mobileNumber, chooseOperator, amount,dicAmount)
        }
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
    
        presenter?.loadTransitionView(self)
    
    }

     
}


extension PopUpViewController: PopUpViewProtocol{
    
    func showError(_ message:String) {
        
    }
    
    func showBusy() {
        
    }
    
    func hideBusy() {
        
    }
    
}

