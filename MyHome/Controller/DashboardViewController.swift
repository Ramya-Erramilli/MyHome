//
//  DashboardViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 11/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    @IBAction func shareAddress(_ sender: UIButton) {
        
        let address = "304, Block - C, My Home Housing Society, Mumbai, Maharastra."
 
        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [address], applicationActivities: nil)

        
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
//        activityViewController.popoverPresentationController?.sourceView = self.view

        activityViewController.isModalInPresentation = true

        self.present(activityViewController, animated: true, completion: nil)
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
