//
//  ScheduleGuestArrivalViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import Firebase

class ScheduleGuestArrivalViewController: UIViewController{
    
    @IBOutlet weak var guestNameOutlet: UITextField!
    @IBOutlet weak var phoneNumberOutlet: UITextField!
    @IBOutlet weak var stepperCountLabel: UILabel!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerOutlet.minimumDate = Date()
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        stepperCountLabel.text = String(Int(sender.value))
    }
    @IBAction func scheduleAction(_ sender: UIButton) {
        
         let date = datePickerOutlet.calendar.dateComponents([.hour, .minute, .month,.day,.year], from: datePickerOutlet.date)
        
        let time = "\(date.day!)-\(date.month!)-\(date.year!)  \(date.hour!):\(date.minute!)"
        let numberOfGuests = stepperCountLabel.text!
        
        if guestNameOutlet.text!.isEmpty || phoneNumberOutlet.text!.isEmpty{
            self.present(CustomAlert.createAlert(title: Constants.errorTitle, descr: Constants.emptyFieldDescr), animated: true)
        }
 
        else if let guestName = guestNameOutlet.text, let phoneNumber = phoneNumberOutlet.text{
//            let guestDetails = GuestDetails().addGuest(name: guestName, phoneNumber: phoneNumber, expectedTime: time, numberOfGuests: stepperCountLabel.text!)
            
            db.collection(Constants.Firestore.guestsDBName).addDocument(data: [
            
                Constants.Firestore.guestName : guestName,
                Constants.Firestore.phoneNumber : phoneNumber,
                Constants.Firestore.expectedTime : time,
                Constants.Firestore.numberOfGuests : numberOfGuests
                
            ]) { (error) in
                if let e = error{
                    self.present(CustomAlert.createAlert(title: Constants.errorTitle, descr: e.localizedDescription), animated: true)
                }
//                }else{
//                    print("Success")
//                }
            }

            self.present(CustomAlert.createAlert(title: "Registered!", descr: """
                
                Your guest \(guestName) is expected to arrive on \(time) .
                Total number of guests are \(numberOfGuests).
                
                """), animated: true) {
                    self.updateUI()
            }
            
        }
        
    }
    
    func updateUI(){
        self.guestNameOutlet.text = ""
        self.phoneNumberOutlet.text = ""
        self.stepperCountLabel.text = "1"
        self.datePickerOutlet.date = Date()
        self.guestNameOutlet.becomeFirstResponder()
        self.view.touchesBegan(.init(), with: .none)
        
    }

}
