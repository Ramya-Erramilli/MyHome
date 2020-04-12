//
//  ViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailOutlet: UITextField!
    @IBOutlet weak var passwordOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginAction(_ sender: UIButton) {
    
        let navVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navC")
        self.present(navVC, animated: true, completion: nil)
    
    
    }
    


}

