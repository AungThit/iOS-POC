//  MobileAccountPresenter.swift
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

class MobileAccountPresenter:MobileAccountPresenterProtocol {

    // MARK: Properties
    var view: MobileAccountViewController?
    
    var interactor: MobileAccountInteractorProtocol?
    
    var wireframe: MobileAccountWireframeProtocol?
    
    //MARK: Properties
    func viewDidLoad() {
        
    }
     func onError(_ error: Error) {
        //handle proper error message via interator , which inturn call errorhandler
        view?.showError(error.localizedDescription)
    }
    func loadHomeView(_ vc:MobileAccountViewController, _ account:Account){
        vc.homedelegate?.passData(account)
        wireframe?.loadHomeView(vc)
    }
   
}
