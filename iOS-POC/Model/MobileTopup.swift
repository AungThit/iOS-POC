//
//  MobileTopup.swift
//  iOS-POC
//
//  Created by AungThit on 05/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import Foundation
import Foundation

struct MobileTopup : Decodable {
    var TransactionStatus:String?
    var ErrorCode:String?
    var ErrorMessage:String?
    var PartnerAmount:Double?
    var TransactionAmount:Double?
    var NetAmount:Double?
    var DisAmount:Double?
    var TotalAmount:Double?
    var ThirdPartyID:String?
    var Detail:String?
    var RespCode:String?
    var RespDescription:String?
   
}
