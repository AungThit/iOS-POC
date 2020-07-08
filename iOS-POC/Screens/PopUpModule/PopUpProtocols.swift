//  PopUpProtocols.swift
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


protocol PopUpWireframeProtocol {
    static func createPopUpModule() -> PopUpViewController
    func loadSuccessView(_ vc: PopUpViewController,_ userAccount:String?,_ mobileNumber:String?,_ chooseOperator:String?,_ amount:Double?,_ disAmount:Double?)
    func loadTransitionView(_ vc:PopUpViewController)
    //Add Methods
}


protocol PopUpViewProtocol {
    var presenter:PopUpPresenterProtocol? { get set }
    func showBusy()
    func hideBusy()
    func showError(_ message:String)
}

protocol PopUpPresenterProtocol {
    var view:PopUpViewController? { get set }
    var interactor:PopUpInteractorProtocol? { get set }
    var wireframe:PopUpWireframeProtocol? { get set }
     //Add methods
    func loadTransitionView(_ vc:PopUpViewController)
    func loadSuccessView(_ vc: PopUpViewController,_ userAccount:String?,_ mobileNumber:String?,_ chooseOperator:String?,_ amount:Double?,_ disAmount:Double?)
    func viewDidLoad()
    func onError(_ error:Error)
}

protocol PopUpInteractorProtocol {
    var presenter:PopUpPresenterProtocol? { get set }
    var dataManager:PopUpDataManagerProtocol? { get set }
    
    //Add Methods
     func onError(_ error:Error)
}

protocol PopUpDataManagerProtocol {
    
    var interactor:PopUpInteractorProtocol? { get set }
    
     func onError(_ error:Error)
}


protocol PopUpDelegate {
    func didChangePopUp(_  newPopUp:PopUpModel)
}
