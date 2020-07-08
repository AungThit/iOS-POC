//  HomeProtocols.swift
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


protocol HomeWireframeProtocol {
    static func createHomeModule() -> HomeViewController
    func loadMobileAccountView(_ vc: HomeViewController,_ acount:[Account])
    func getAmount(_ amount:Double?)
    func getOperator(_ chooseOperator:String?)
    func getMobileNumber(_ mobileNumber:String?,_ userID:String?,_ userDescription
    :String?)
    func loadTransitionView(_ vc: HomeViewController,_ mobileTopup:MobileTopup)
    //Add Methods
}


protocol HomeViewProtocol {
    var presenter:HomePresenterProtocol? { get set }
    func showBusy()
    func hideBusy()
    func showError(_ message:String)
}

protocol HomePresenterProtocol {
    var view:HomeViewController? { get set }
    var interactor:HomeInteractorProtocol? { get set }
    var wireframe:HomeWireframeProtocol? { get set }
    //Add methods
    func viewDidLoad()
    func onError(_ error:Error)
    func showRequireAccountError()
    func showRequireMobileNumberError()
    func showChooseOneOperatorError()
    func showRequireAmountError()
    func hideRequireAccountError()
    func hideRequireMobileNumberError()
    func hideChooseOneOperatorError()
    func hideRequireAmountError()
    func showAccountData()
    func PostAccount(_ account:[Account])
    func checkVerilation(_ account:String?,_ mobileNumber:String?)
    func postAmount(_ amount:Double?)
    func postData(_ mobileNumber:String?,_ userID:String,_ userDescription:String)
    func postOperator(_ chooseOperator:String)
//    func loadTransitionView(_ vc:HomeViewController)
    func postMobileTopup(_ mobileTopup:MobileTopup)
}

protocol HomeInteractorProtocol {
    var presenter:HomePresenterProtocol? { get set }
    var dataManager:HomeDataManagerProtocol? { get set }
    func mobileTopupValidation(_ account:String?,_ mobileNumber:String?)
    //Add Methods
    func onError(_ error:Error)
    func postMobileTopup(_ mobileTopup:MobileTopup)
}

protocol HomeDataManagerProtocol {
    func getMobileTopup()
    var interactor:HomeInteractorProtocol? { get set }
    func onError(_ error:Error)
}


protocol HomeDelegate {
    func passData(_ account:Account)
}


