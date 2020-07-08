//  LoginProtocols.swift
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


protocol LoginWireframeProtocol {
    static func createLoginModule() -> LoginViewController
    func loadHomeView(_ vc: LoginViewController,_ acount:[Account])
    //Add Methods
}


protocol LoginViewProtocol {
    var presenter:LoginPresenterProtocol? { get set }
    func showBusy()
    func hideBusy()
    func showError(_ message:String)
}

protocol LoginPresenterProtocol {
    var view:LoginViewController? { get set }
    var interactor:LoginInteractorProtocol? { get set }
    var wireframe:LoginWireframeProtocol? { get set }
    //Add methods
    func viewDidLoad()
    func onError(_ error:Error)
    func showUserNameError()
    func showPasswordError()
    func postAccount(_ account:[Account])
    func checkValidation(_ username:String?,_ password:String?)
    
}

protocol LoginInteractorProtocol {
    var presenter:LoginPresenterProtocol? { get set }
    var dataManager:LoginDataManagerProtocol? { get set }
    
    //Add Methods
    func onError(_ error:Error)
    func loginValidation(_ username:String?,_ password:String?)
    func postAccount(_ account:[Account])
}

protocol LoginDataManagerProtocol {
    
    var interactor:LoginInteractorProtocol? { get set }
    func getAccount()
    func onError(_ error:Error)
}

