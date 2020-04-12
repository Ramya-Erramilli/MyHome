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
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 600

//        tableView.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    
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
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let helpername = data[Constants.Firestore.helpername] as? String, let helperWork = data[Constants.Firestore.helperWork] as? String, let helperPhoneNumber = data[Constants.Firestore.helperPhoneNumber] {
                                
                                var helper = Helper(name: helpername, work: helperWork, phoneNumber: helperPhoneNumber as! String)
                                self.helpers.append(helper)
                                
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
        
        cell.imageViewOutlet.image = UIImage(named: "friends_icon")
        cell.nameLabel.text = helpers[indexPath.row].name
        cell.workLabel.text = helpers[indexPath.row].work
        cell.workLabel.sizeToFit()
        return cell
    }
    
    
//    var phNo:String?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        var popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HelperDetails") as! HelperViewController
//        tableView.reloadData()
        popOverVC.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = popOverVC.popoverPresentationController!
//        popover.barButtonItem = sender
        self.present(popOverVC, animated: true, completion: nil)
    
//        phNo = helpers[indexPath.row].phoneNumber
        popOverVC.nameLabel.text = helpers[indexPath.row].name
        popOverVC.phNo.text = helpers[indexPath.row].phoneNumber
        popOverVC.workLabel.text = helpers[indexPath.row].work
        
        popOverVC.nameLabel.sizeToFit()
        popOverVC.workLabel.sizeToFit()
        popOverVC.phNo.sizeToFit()

        
        
    }
    

}
   
