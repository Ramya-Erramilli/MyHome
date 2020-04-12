//
//  GetHelpTableViewCell.swift
//  MyHome
//
//  Created by Ramya Seshagiri on 12/04/20.
//  Copyright © 2020 Ramya Seshagiri. All rights reserved.
//

import UIKit

class GetHelpTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var imageViewOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
