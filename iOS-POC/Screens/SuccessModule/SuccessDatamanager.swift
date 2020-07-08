//  SuccessDatamanager.swift
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

class SuccessDataManager : SuccessDataManagerProtocol{
    
    var model = SuccessModel()
    
    var interactor: SuccessInteractorProtocol?
    
    func onError(_ error:Error) {
        interactor?.onError(error)
    }
    
    func getSucccess() {
//        model.delegate = self
        model.getSuccess()
    }
    
    func successRetrieved(_ success: Success) {
        interactor?.postSuccess()
    }
    
}


