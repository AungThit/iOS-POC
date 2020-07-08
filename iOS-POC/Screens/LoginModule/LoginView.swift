//  LoginView.swift
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

class LoginViewController:UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var secureBtn: UIButton!
    @IBOutlet weak var rememberClickBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet var languageBtn: [UIButton]!
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var snipper: UIActivityIndicatorView!
    
    // MARK: Properties
    var presenter:LoginPresenterProtocol?
    
    
    var model = AccountModel()
    var accounts = [Account]()
    
    var iconClick = true
    var rememberClick = false
    var languageClick = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup( )
        presenter?.viewDidLoad()
        usernameLabel.isHidden = true
        passwordLabel.isHidden = true
        snipper.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func setup( ){
        Utilities.setGradientBackground(view)
        Utilities.buttonBoder(loginBtn)
    }
    
    func rememberMe() {
        if(rememberClick == true) {
            rememberClickBtn.setImage(UIImage(named: "clickOff.png"), for: .normal)
            rememberClick = false
        } else {
            rememberClickBtn.setImage(UIImage(named: "clickOn.png"), for: .normal)
            rememberClick = true
        }
    }
    @IBAction func changeLanguageTapped(_ sender: UIButton) {
        
        unselectBtn(languageBtn)
        switch sender.tag {
        case 10:
            languageBtn(sender)
        case 20:
            languageBtn(sender)
        default:
            break
        }
    }
    
    func unselectBtn(_ buttons:[UIButton]) {
        for button in buttons {
            button.layer.borderWidth = 0
        }
    }
    
    func languageBtn(_ button:UIButton){
       
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
            button.layer.cornerRadius = 3.0
//            button.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    }
    
    @IBAction func secureAction(_ sender: Any){
        let userPassword = passwordTextField.text!;
        if(iconClick == true) {
            passwordTextField.isSecureTextEntry = false
            secureBtn.setImage(UIImage(named: "secureOff.png"), for: .normal)
            iconClick = false
        } else {
            passwordTextField.isSecureTextEntry = true
            secureBtn.setImage(UIImage(named: "secureOn.png"), for: .normal)
            iconClick = true
        }
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        snipper.isHidden = false
        snipper.startAnimating()
        presenter?.checkValidation(usernameTextField.text, passwordTextField.text)
        
    }
    
    @IBAction func rememberClickTapped(_ sender: UIButton) {
        rememberMe()
    }
    
    @IBAction func rememberMeTapped(_ sender: UIButton) {
        rememberMe()
    }
    
}

extension LoginViewController: LoginViewProtocol{
    
    func showError(_ message:String) {
        
    }
    
    func showBusy() {
        
    }
    
    func hideBusy() {
        self.snipper.isHidden = true
        self.snipper.stopAnimating()
    }
    
    func showUserNameError () {
        usernameLabel.isHidden = false
        usernameLabel.textColor = .red
    }
    
    func showPasswordError() {
        passwordLabel.isHidden = false
        passwordLabel.textColor = .red
    }
    
}
