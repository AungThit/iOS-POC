//  MobileAccountView.swift
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

class MobileAccountViewController:UIViewController {
    
    var account = [Account]()
    
    var homedelegate : HomeDelegate?
    // MARK: Properties
    var presenter:MobileAccountPresenterProtocol?
    var delegate:MobileAccountDelegate?
    
    @IBOutlet weak var accountTypeLable: UILabel!
    @IBOutlet weak var accountIDLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup( )
        presenter?.viewDidLoad()
    }
    
    func setup( ){
        Utilities.setGradientBackground(view)
    }
    
}

extension MobileAccountViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var array = [String]()
        for ac in account {
            if ac.AccountType == "CAA" || ac.AccountType == "SBA"{
                array.append(ac.AccountType!)
            }
        }
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mobiletopupcell", for: indexPath) as! MobileAccountTableViewCell
        let account = self.account[indexPath.row]
        cell.config(account)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.loadHomeView(self,account[indexPath.row])
    }
    
}

extension MobileAccountViewController: MobileAccountViewProtocol{
    
    func showError(_ message:String) {
        
    }
    
    func showBusy() {
        
    }
    
    func hideBusy() {
        
    }
    
}

