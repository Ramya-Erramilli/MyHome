//
//  DashboardViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import Firebase
import UIKit

class DashboardViewController: UIViewController{

    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = """
                \((Auth.auth().currentUser?.email)!)
                            (me)
        """
    }
    //Enables the user to share address over various platforms
    @IBAction func shareAddress(_ sender: UIButton) {
        
        let address = "304, Block - C, My Home Housing Society, Mumbai, Maharastra."
 
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [address], applicationActivities: nil)

        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
//        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    //Logout the user
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
            
        } catch let signOutError as NSError {
            self.present(CustomAlert.createAlert(title: "Error", descr: signOutError.localizedDescription), animated: true, completion: nil)
        }          
    }
 
}
