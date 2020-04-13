//
//  HomeNavigationController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class HomeNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
}
