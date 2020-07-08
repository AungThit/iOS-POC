//  Success.swift
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

struct Success : Decodable {
    // TODO: Declare properties
    var TransactionID:String?
    var TransactionStatus:String?
    var ErrorCode:String?
    var ErrorMessage:String?
    var PartnerAmount:Int?
    var TransactionAmount:Int?
    var Detail:String?
    var EBARefNo:String?
    var PartnerRefNo:String?
    var RespCode:String?
    var RespDescription:String?
}

protocol SuccessModelProtocol {
    func successRetrieved(_ success: Success)
}
class SuccessModel {
    
    var delegate : SuccessModelProtocol?
    
    func getSuccess() {
        let stringURL = "https://raw.githubusercontent.com/NayMyo7/ios_poc/master/json/topup_confirm_response.json"
        
        let url = URL(string: stringURL)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let successService = try decoder.decode(Success.self, from: data!)
                    let success = successService
                    
                    DispatchQueue.main.async {
                        self.delegate?.successRetrieved(success)
                    }
                } catch  {
                    
                }
            }
        }
        dataTask.resume()
    }
    
}


