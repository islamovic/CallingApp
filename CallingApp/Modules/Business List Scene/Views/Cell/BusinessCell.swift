//
//  BusinessCell.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(business: Business) {

        if let address = business.address {
            self.addressLabel.text = address.title
            if let secondray = address.secondary {
                secondaryLabel.isHidden = false
                self.secondaryLabel.text = secondray
            } else {
                secondaryLabel.isHidden = true
            }
        }
    }
    
}
