
//  HomeWireframe.swift
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


class HomeWireframe: HomeWireframeProtocol {
   
    static var view: HomeViewController? //***
    
    static func createHomeModule() -> HomeViewController {
        
        let storyBoard =  UIStoryboard.init(name:"Home", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        let presenter = HomePresenter( )
        let interactor = HomeInteractor( )
        let dataManager = HomeDataManager( )
        let wireframe = HomeWireframe( )
        HomeWireframe.view = view // **
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        
        
        return view
    }
    
    func loadMobileAccountView(_ vc: HomeViewController, _ acount: [Account]) {
        let mobileAccountVC = MobileAccountWireframe.createMobileAccountModule()
        mobileAccountVC.modalPresentationStyle = .fullScreen
        mobileAccountVC.account = acount
        mobileAccountVC.homedelegate = vc
        HomeWireframe.view?.present(mobileAccountVC, animated: true, completion: nil)
    }
    
    let transitionVC = TransitionWireframe.createTransitionModule()
    
//    func loadTransitionView(_ vc:HomeViewController) {
//        HomeWireframe.view?.present(transitionVC, animated: true, completion: nil)
//    }
   
    func getAmount(_ amount:Double?) {
        transitionVC.amount = amount
    }
    
    func getOperator(_ chooseOperator:String?) {
        transitionVC.chooseOperator = chooseOperator
    }
    
    func getMobileNumber(_ mobileNumber:String?,_ userID:String?,_ userDescription
        :String?) {
        transitionVC.mobileNumber = mobileNumber
        transitionVC.userAccount = userID
        transitionVC.userDescription = userDescription
    }
    func loadTransitionView(_ vc: HomeViewController,_ mobileTopup:MobileTopup) {
        transitionVC.mobileTopup = mobileTopup
        HomeWireframe.view?.present(transitionVC, animated: true, completion: nil)
    }
    
}
