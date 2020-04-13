//
//  Guest.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import Foundation

class GuestDetails {
    
    var name: String?
    var phoneNumber:String?
    var expectedTime:String?
    var numberOfGuests:String?
    
    func addGuest(name:String,phoneNumber:String,expectedTime:String,numberOfGuests:String) {
        self.name = name
        self.expectedTime = expectedTime
        self.phoneNumber = phoneNumber
        self.numberOfGuests = numberOfGuests
        
//        print("Added")
    }
    
    func returnGuestDetails(){
        
    }
    
   
    
}
