//
//  PayBillsViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 12/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class PayBillsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var billType: UIPickerView!
    var billTypes = ["Rent","Electricity","Maintenance","Water Bill"]
    var billAmounts = [25000,1200,3000,500]
    var row = 0
    
    //Picker view data source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return billTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return billTypes[row]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        billType.dataSource = self
        billType.delegate = self

    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.row = row
        
    }
    
    @IBAction func payAction(_ sender: UIButton) {
        
        // Ideally the page should be redirected to a payment gateway,Showing an alert instead.
        
        let alert = CustomAlert.createAlert(title: "Pay Bill", descr: """
            Your \(billTypes[self.row]) bill is  Rs. \(billAmounts[self.row])/-.
            Do you want to proceed to payment?
            """)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    


}
