//  LoginInteractor.swift
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

class LoginInteractor:LoginInteractorProtocol {
    
    var presenter:LoginPresenterProtocol?
    var dataManager:LoginDataManagerProtocol?
    
    //TODO: Create Method Here
    func onError(_ error:Error) {
        presenter?.onError(error)
    }
    func loginValidation(_ username:String?,_ password:String?) {
        
        if let username = username,username.count == 0 {
            presenter?.showUserNameError()
        }
        
        if let password = password, password.count == 0 {
            presenter?.showPasswordError()
        }
        
        if  let username = username,username.count != 0,let password = password, password.count != 0 {
            dataManager?.getAccount()
        }
    }
    
    func postAccount(_ account:[Account]) {
        presenter?.postAccount(account)
    }
    
}
