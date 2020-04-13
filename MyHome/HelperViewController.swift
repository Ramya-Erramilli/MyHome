//
//  HelperViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 12/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class HelperViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var phNo: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = ""
        workLabel.text = ""
        phNo.text = ""
        
        // Gesutre Recognition enabled
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        phNo.isUserInteractionEnabled = true
        phNo.addGestureRecognizer(tap)
        }

        @objc
        func tapFunction(sender:UITapGestureRecognizer) {
            
            // On tapping the phone number label, enabled making a call -- Works only on real mobile, not simulator
            
//             if let url = URL(string: "TEL://123456789") {
//                 UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
////                UIApplication.shared.openURL(url)
////                       UIApplication.shared.open(url, options: [:], completionHandler: nil)
//             }else{
//                print("here")
//            }
            //Instead presenting an Alert
            let alert = UIAlertController(title: "Call", message: "Do you want to make a call?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
    

        

}
