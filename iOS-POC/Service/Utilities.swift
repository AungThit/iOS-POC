//
//  Utilities.swift
//  iOS-POC
//
//  Created by AungThit on 05/07/2020.
//  Copyright © 2020 Aung Thit. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func buttonBoder(_ loginBtn:UIButton) {
        loginBtn.layer.borderWidth = 0.2
        loginBtn.layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        loginBtn.layer.cornerRadius = 5.0
        loginBtn.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        loginBtn.backgroundColor = UIColor(red: 83.0/255.0, green: 1.0/255.0, blue: 127.0/255.0, alpha: 1.0)
        // Shadow and Radius
        loginBtn.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        loginBtn.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        loginBtn.layer.shadowOpacity = 1.0
        loginBtn.layer.shadowRadius = 0.0
        loginBtn.layer.masksToBounds = false
        loginBtn.layer.cornerRadius = 4.0
    }
    
    static func setGradientBackground(_ view:UIView) {
          let colorTop =  UIColor(red: 2.0/255.0, green: 1.0/255.0, blue: 96.0/255.0, alpha: 1.0).cgColor
          let colorBottom = UIColor(red: 83.0/255.0, green: 1.0/255.0, blue: 127.0/255.0, alpha: 1.0).cgColor
          let gradientLayer = CAGradientLayer()
          gradientLayer.colors = [colorTop,colorBottom]
          gradientLayer.locations = [0.03,0.5]
          gradientLayer.frame = view.bounds
          view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    static func transparentNavBar(_ navBar:UINavigationBar) {
           navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
           navBar.shadowImage = UIImage()
           navBar.titleTextAttributes = [
               NSAttributedString.Key.foregroundColor:UIColor.white]
       }
    
}

