//  SuccessProtocols.swift
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


protocol SuccessWireframeProtocol {
    static func createSuccessModule() -> SuccessViewController
    //Add Methods
}


protocol SuccessViewProtocol {
    var presenter:SuccessPresenterProtocol? { get set }
    func showBusy()
    func hideBusy()
    func showError(_ message:String)
}

protocol SuccessPresenterProtocol {
    var view:SuccessViewController? { get set }
    var interactor:SuccessInteractorProtocol? { get set }
    var wireframe:SuccessWireframeProtocol? { get set }
     //Add methods
    func viewDidLoad()
    func onError(_ error:Error)
    func postSuccess() 
}

protocol SuccessInteractorProtocol {
    var presenter:SuccessPresenterProtocol? { get set }
    var dataManager:SuccessDataManagerProtocol? { get set }
    
    //Add Methods
     func onError(_ error:Error)
    func postSuccess() 
}

protocol SuccessDataManagerProtocol {
    
    var interactor:SuccessInteractorProtocol? { get set }
        func getSucccess()
     func onError(_ error:Error)
}


protocol SuccessDelegate {
    func didChangeSuccess(_  newSuccess:Success)
}

//protocol SuccessModelProtocol {
//    func successRetrieved(_ success: Success)
//}
