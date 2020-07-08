//
//  Account.swift
//  testviper
//
//  Created by AungThit on 01/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import Foundation

struct Account : Decodable{
    var AccountID :String?
    var AccountType : String?
    var AccountDesc : String?
    var Currency : String?
    var BranchCode: String?
    var AvailableBal : String?
}
