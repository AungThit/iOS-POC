//  TransitionProtocols.swift
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


protocol TransitionWireframeProtocol {
    static func createTransitionModule() -> TransitionViewController
    func loadPopUpView(_ vc: TransitionViewController,_ userAccount:String?,_ mobileNumber:String?,_ chooseOperator:String?,_ amount:Double?,_ disAmount:Double?)
    func loadHomeView(_ vc:TransitionViewController)
}


protocol TransitionViewProtocol {
    var presenter:TransitionPresenterProtocol? { get set }
    func showBusy()
    func hideBusy()
    func showError(_ message:String)
}

protocol TransitionPresenterProtocol {
    var view:TransitionViewController? { get set }
    var interactor:TransitionInteractorProtocol? { get set }
    var wireframe:TransitionWireframeProtocol? { get set }
     //Add methods
    func viewDidLoad()
    func onError(_ error:Error)
    func loadPopUpView(_ vc: TransitionViewController,_ userAccount:String?,_ mobileNumber:String?,_ chooseOperator:String?,_ amount:Double?,_ disAmount:Double?)
    func loadHomeView(_ vc:TransitionViewController)
   }

protocol TransitionInteractorProtocol {
    var presenter:TransitionPresenterProtocol? { get set }
    var dataManager:TransitionDataManagerProtocol? { get set }
    
    //Add Methods
     func onError(_ error:Error)
}

protocol TransitionDataManagerProtocol {
    
    var interactor:TransitionInteractorProtocol? { get set }
    
     func onError(_ error:Error)
}


protocol TransitionDelegate {
    func didChangeTransition(_  newTransition:TransitionModel)
}

