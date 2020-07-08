//  HomeInteractor.swift
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

class HomeInteractor:HomeInteractorProtocol {
    
    var presenter:HomePresenterProtocol?
    var dataManager:HomeDataManagerProtocol?
    
    //TODO: Create Method Here
    func onError(_ error:Error) {
        presenter?.onError(error)
    }
    
    func mobileTopupValidation(_ account:String?,_ mobileNumber:String?) {
        
        
        if let account = account, account.count == 0 {
            presenter?.showRequireAccountError()
        }
        if let mobileNumber = mobileNumber, mobileNumber.count == 0{
            presenter?.showRequireMobileNumberError()
        }
        if let account = account, account.count != 0, let mobileNumber = mobileNumber,mobileNumber.count != 0 {
            dataManager?.getMobileTopup()
        }
    }
    
    func showAccountData() {
        presenter?.showAccountData()
    }
    
    func postMobileTopup(_ mobileTopup:MobileTopup) {
        presenter?.postMobileTopup(mobileTopup)
    }
    
}
