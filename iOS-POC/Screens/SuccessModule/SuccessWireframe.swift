
//  SuccessWireframe.swift
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


class SuccessWireframe: SuccessWireframeProtocol {
    static func createSuccessModule() -> SuccessViewController {
        
        let storyBoard =  UIStoryboard.init(name:"Success", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "Success") as! SuccessViewController
        
        let presenter = SuccessPresenter( )
        let interactor = SuccessInteractor( )
        let dataManager = SuccessDataManager( )
        let wireframe = SuccessWireframe( )
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.interactor = interactor
        
        
        return view
    }
    
//    func loadSuccesssView(_ success:[Success]) {
//        let successVC = SuccessWireframe.createSuccessModule()
//        successVC.success = success
//    }
    
}
