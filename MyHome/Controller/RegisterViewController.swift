//
//  RegisterViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerUser(_ sender: UIButton) {

        //Empty feilds validation
        if usernameOutlet.text!.isEmpty || passwordOutlet.text!.isEmpty{
             self.present(CustomAlert.createAlert(title: "Error", descr: "One or more fields empty. Kindly check."), animated: true, completion: nil)
        }

        // Adding user into Users db using Firebase
        
        if let email = usernameOutlet.text, let password = passwordOutlet.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let err = error{
                            // Display error alert
//                    print(err.localizedDescription)
                    self.present(CustomAlert.createAlert(title: "Error", descr: err.localizedDescription), animated: true, completion: nil)
                }else{
                        //Succesful registration of users -- > Navigate to next VC
                    let navVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "navC")
                    self.show(navVC, sender: self)
                     navVC.present(CustomAlert.createAlert(title: "Success", descr: "You are succesfully registered."), animated: true, completion: nil)
//                     print(authResult)
                }
            
            }
        }
    
    }
    
}
