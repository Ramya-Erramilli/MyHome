//
//  GetHelpTableViewController.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 12/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit
import Firebase

class GetHelpTableViewController: UITableViewController {

    let db = Firestore.firestore()
    var helpers : [Helper] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData(){
        
        db.collection(Constants.Firestore.helperDBname).getDocuments { (querySnapshot, error) in
            if let e = error{
                self.present(CustomAlert.createAlert(title: Constants.errorTitle, descr: e.localizedDescription), animated: true)
            }else{
                //Retriving Helper data from Firestore
//                var helper = querySnapshot?.documents[0].data()[Constants.Firestore.helpername]
                    if let snapshotDocuments = querySnapshot?.documents { // get the qiery snapshot
                        for doc in snapshotDocuments { // Get doc from snapshot
                            let data = doc.data() //get data from doc
                            if let helpername = data[Constants.Firestore.helpername] as? String, let helperWork = data[Constants.Firestore.helperWork] as? String, let helperPhoneNumber = data[Constants.Firestore.helperPhoneNumber] { // Check for optionals
                                
                                let helper = Helper(name: helpername, work: helperWork, phoneNumber: helperPhoneNumber as! String)
                                self.helpers.append(helper) // Add the helper to lost of helpers
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return helpers.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GetHelpTableViewCell
        let helper = helpers[indexPath.row]
        cell.imageViewOutlet.image = UIImage(named: "friends_icon")
        cell.nameLabel.text = helper.name
        cell.workLabel.text = helper.work
        cell.phoneNumberOutlet.text = helper.phoneNumber
        cell.phoneNumberOutlet.sizeToFit()
        cell.workLabel.sizeToFit()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HelperDetails") as! HelperViewController

        popOverVC.modalPresentationStyle = .popover
//        let popover: UIPopoverPresentationController = popOverVC.popoverPresentationController!

        self.present(popOverVC, animated: true, completion: nil)

        popOverVC.nameLabel.text = helpers[indexPath.row].name
        popOverVC.phNo.text = helpers[indexPath.row].phoneNumber
        popOverVC.workLabel.text = helpers[indexPath.row].work

        popOverVC.nameLabel.sizeToFit()
        popOverVC.workLabel.sizeToFit()
        popOverVC.phNo.sizeToFit()
    }
}
   
