//  PopUpPresenter.swift
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

class PopUpPresenter:PopUpPresenterProtocol {

    // MARK: Properties
    var view: PopUpViewController?
    
    var interactor: PopUpInteractorProtocol?
    
    var wireframe: PopUpWireframeProtocol?
    
    //MARK: Properties
    func viewDidLoad() {
        
    }
     func onError(_ error: Error) {
        //handle proper error message via interator , which inturn call errorhandler
        view?.showError(error.localizedDescription)
    }
    
    func loadTransitionView(_ vc:PopUpViewController) {
        wireframe?.loadTransitionView(vc)
    }
    
    func loadSuccessView(_ vc: PopUpViewController,_ userAccount:String?,_ mobileNumber:String?,_ chooseOperator:String?,_ amount:Double?,_ disAmount:Double?){
        wireframe?.loadSuccessView(vc, userAccount, mobileNumber, chooseOperator, amount,disAmount)
    }
    
}
