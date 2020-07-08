//
//  MobileTopupModel.swift
//  iOS-POC
//
//  Created by AungThit on 05/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import Foundation

protocol MobileTopupProtocol {
    func mobileTopupRetrieved(_ mobileTopUp:MobileTopup)
}

class MobileTopupModel {
    
    var delegate:MobileTopupProtocol?
    
    func getMobileTopup() {
        let stringURL = "https://raw.githubusercontent.com/NayMyo7/ios_poc/master/json/topup_response.json"
        let url = URL(string: stringURL)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        
        let session = URLSession.shared
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                
              do {
                let mobileTopupService = try decoder.decode(MobileTopup.self, from: data!)
                let mobileTopup = mobileTopupService
                
                DispatchQueue.main.async {
                    self.delegate?.mobileTopupRetrieved(mobileTopup)
                }
                
              }catch {
                    print("error")
                }
            }
        }
        datatask.resume()
    }
}
