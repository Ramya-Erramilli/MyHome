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
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tapFunction))
        phNo.isUserInteractionEnabled = true
        phNo.addGestureRecognizer(tap)
        }

        @objc
        func tapFunction(sender:UITapGestureRecognizer) {
            
            // On tapping the phone number label,
//             if let url = URL(string: "TEL://123456789") {
//                 UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
////                UIApplication.shared.openURL(url)
////                       UIApplication.shared.open(url, options: [:], completionHandler: nil)
//             }else{
//                print("here")
//            }

            self.present(CustomAlert.createAlert(title: "Call", descr: "Do you want to make a call?"), animated: true, completion: nil)
        }
        
        // Do any additional setup after loading the view.
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
