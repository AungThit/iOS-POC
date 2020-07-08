
//  MobileAccountWireframe.swift
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


class MobileAccountWireframe: MobileAccountWireframeProtocol {
    static func createMobileAccountModule() -> MobileAccountViewController {
        
        let storyBoard =  UIStoryboard.init(name:"MobileAccount", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "MobileAccount") as! MobileAccountViewController
        
        let presenter = MobileAccountPresenter( )
        let interactor = MobileAccountInteractor( )
        let dataManager = MobileAccountDataManager( )
        let wireframe = MobileAccountWireframe( )
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        
        return view
    }
    
    func loadHomeView(_ vc:MobileAccountViewController) {
        vc.dismiss(animated: true, completion: nil)
    }
    
}
