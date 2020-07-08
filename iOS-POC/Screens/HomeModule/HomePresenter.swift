//  HomePresenter.swift
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

class HomePresenter:HomePresenterProtocol {

    // MARK: Properties
    var view: HomeViewController?
    
    var interactor: HomeInteractorProtocol?
    
    var wireframe: HomeWireframeProtocol?
    
    //MARK: Properties
    func viewDidLoad() {
        
    }
     func onError(_ error: Error) {
        //handle proper error message via interator , which inturn call errorhandler
        view?.showError(error.localizedDescription)
    }
    
    func showRequireAccountError() {
        view?.showRequireAccountError()
    }
    
    func showRequireMobileNumberError() {
        view?.showRequireMobileNumberError()
    }
    
    func showChooseOneOperatorError() {
        view?.showChooseOneOperatorError()
    }
    
    func showRequireAmountError() {
        view?.showRequireAmountError()
    }
    
    func showAccountData() {
        view?.showAccountData()
    }
    
    func checkVerilation(_ account:String?,_ mobileNumber:String?) {
        interactor?.mobileTopupValidation(account, mobileNumber)
    }
    
    func PostAccount(_ account:[Account]) {
        wireframe?.loadMobileAccountView(view!, account)
    }
    
    func hideRequireAccountError() {
        view?.hideRequireAccountError()
    }
    
    func hideRequireMobileNumberError() {
        view?.hideRequireAccountError()
    }
    
    func hideChooseOneOperatorError() {
        view?.hideRequireAccountError()
    }
    
    func hideRequireAmountError() {
        view?.hideRequireAccountError()
    }
   
    func postAmount(_ amount:Double?) {
        wireframe?.getAmount(amount)
    }
    
    func postData(_ mobileNumber:String?,_ userID:String,_ userDescription:String) {
        wireframe?.getMobileNumber(mobileNumber, userID, userDescription)
    }
    
    func postOperator(_ chooseOperator:String) {
        wireframe?.getOperator(chooseOperator)
    }
    
    func postMobileTopup(_ mobileTopup:MobileTopup) {
        view?.hideBusy()
        wireframe?.loadTransitionView(view!, mobileTopup)
    }
    
}
