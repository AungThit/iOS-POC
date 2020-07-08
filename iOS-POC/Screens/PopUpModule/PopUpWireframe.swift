
//  PopUpWireframe.swift
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


class PopUpWireframe: PopUpWireframeProtocol {
   
    
    static var view:PopUpViewController?
    
    static func createPopUpModule() -> PopUpViewController {
        
        let storyBoard =  UIStoryboard.init(name:"PopUp", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
        
        let presenter = PopUpPresenter( )
        let interactor = PopUpInteractor( )
        let dataManager = PopUpDataManager( )
        let wireframe = PopUpWireframe( )
        PopUpWireframe.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        
        
        return view
    }
    
    func loadTransitionView(_ vc:PopUpViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
    
    func loadSuccessView(_ vc: PopUpViewController,_ userAccount:String?,_ mobileNumber:String?,_ chooseOperator:String?,_ amount:Double?,_ disAmount:Double?) {
        let successVC = SuccessWireframe.createSuccessModule()
        successVC.amount = amount
        successVC.userAccount = userAccount
        successVC.moobileNumber = mobileNumber
        successVC.chooseOperator = chooseOperator
        successVC.discAmount = disAmount
        PopUpWireframe.view!.present(successVC, animated: true, completion: nil)
    }
    
}
