//  MobileAccountProtocols.swift
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


protocol MobileAccountWireframeProtocol {
    static func createMobileAccountModule() -> MobileAccountViewController
    func loadHomeView(_ vc:MobileAccountViewController)
    //Add Methods
}


protocol MobileAccountViewProtocol {
    var presenter:MobileAccountPresenterProtocol? { get set }
    func showBusy()
    func hideBusy()
    func showError(_ message:String)
}

protocol MobileAccountPresenterProtocol {
    var view:MobileAccountViewController? { get set }
    var interactor:MobileAccountInteractorProtocol? { get set }
    var wireframe:MobileAccountWireframeProtocol? { get set }
     //Add methods
    func viewDidLoad()
    func loadHomeView(_ vc:MobileAccountViewController,_ account:Account)
    func onError(_ error:Error)
}

protocol MobileAccountInteractorProtocol {
    var presenter:MobileAccountPresenterProtocol? { get set }
    var dataManager:MobileAccountDataManagerProtocol? { get set }
    
    //Add Methods
     func onError(_ error:Error)
}

protocol MobileAccountDataManagerProtocol {
    
    var interactor:MobileAccountInteractorProtocol? { get set }
    
     func onError(_ error:Error)
}


protocol MobileAccountDelegate {
    func didChangeMobileAccount(_  newMobileAccount:MobileAccountModel)
}
