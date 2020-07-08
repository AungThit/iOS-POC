//  LoginPresenter.swift
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

class LoginPresenter:LoginPresenterProtocol {
    
    // MARK: Properties
    var view: LoginViewController?
    
    var interactor: LoginInteractorProtocol?
    
    var wireframe: LoginWireframeProtocol?
    
    //MARK: Properties
    func viewDidLoad() {
        
    }
    func onError(_ error: Error) {
        //handle proper error message via interator , which inturn call errorhandler
        view?.showError(error.localizedDescription)
    }
    func showHomeView() {
        //TODO: - ask interactor whether should jump or show error
        //        wireframe?.loadHomeView(view!)
        
    }
    
    func showUserNameError() {
        view?.showUserNameError()
    }
    
    func showPasswordError() {
        view?.showPasswordError()
    }
    
    func checkValidation(_ username:String?,_ password:String?) {
        interactor?.loginValidation(username, password)
    }
    
    func postAccount(_ account:[Account]) {
        view?.hideBusy()
        wireframe?.loadHomeView(view!, account)
    }
    
}
