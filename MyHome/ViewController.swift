//
//  ViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import Firebase
import CLTypingLabel
class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: CLTypingLabel!
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "My Home "

    }
    
    @IBAction func loginAction(_ sender: UIButton) {
    
        if emailOutlet.text!.isEmpty || passwordOutlet.text!.isEmpty{
            self.present(CustomAlert.createAlert(title: "Error", descr: Constants.emptyFieldDescr), animated: true, completion: nil)
        }
        else if let email = emailOutlet.text, let password = passwordOutlet.text{ // checking for nil or invalid
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                // guard let self = self else { return } // to avoid retain cycle
                
                if let err = error{
                    // Display error
//                    print(err.localizedDescription)
                    self.present(CustomAlert.createAlert(title: "Error", descr: err.localizedDescription), animated: true, completion: nil)
                    
                }else{
                    //Succesful registration of users -- > Navigate to next VC using Segue
                    self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                    
                }
                
            }
        }       
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Constants.loginSegue{
            return false
        }
        return true
    }
    
   
}

