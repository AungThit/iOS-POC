//
//  AccountModel.swift
//  testviper
//
//  Created by AungThit on 01/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import Foundation

protocol AccountModelProtocol {
    func accountRetrieved(_ account:[Account])
}

class AccountModel {
    
    var delegate:AccountModelProtocol?
    
    func getAccount() {
       
        let stringURL = "https://raw.githubusercontent.com/NayMyo7/ios_poc/master/json/login_response.json"
        
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
                    let accountService = try decoder.decode(AccountService.self, from: data!)
                    let accounts = accountService.lstAccount!
                    
                    DispatchQueue.main.async {
                        self.delegate?.accountRetrieved(accounts)
                    }
                }
                catch {
                    
                }
            }
        }
        
        dataTask.resume()
    }
}
