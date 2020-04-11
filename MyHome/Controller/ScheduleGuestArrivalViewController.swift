//
//  ScheduleGuestArrivalViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class ScheduleGuestArrivalViewController: UIViewController {
    @IBOutlet weak var guestNameOutlet: UITextField!
    @IBOutlet weak var phoneNumberOutlet: UITextField!
    @IBOutlet weak var stepperCountLabel: UILabel!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        stepperCountLabel.text = String(Int(sender.value))
    }
    @IBAction func scheduleAction(_ sender: UIButton) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
