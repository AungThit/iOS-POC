//
//  AccountService.swift
//  testviper
//
//  Created by AungThit on 01/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import Foundation

struct AccountService :Decodable {
    var RespCode:String?
    var RespDescription:String?
    var UserName:String?
    var lstAccount:[Account]?
}
