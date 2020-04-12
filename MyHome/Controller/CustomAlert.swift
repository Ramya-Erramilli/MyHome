//
//  CustomAlert.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import Foundation
import UIKit
//Class to create Custom Alert

class CustomAlert{
    
    static func createAlert(title:String,descr:String)-> UIAlertController{
        
        var alert = UIAlertController(title: title, message: descr, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
        
    }
    
    static func createAlertSheet(title:String,descr:String)-> UIAlertController{
        
        var alert = UIAlertController(title: title, message: descr, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
        
    }
    
    
}
