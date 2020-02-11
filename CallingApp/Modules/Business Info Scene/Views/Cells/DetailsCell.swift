//
//  DetailsCell.swift
//  CallingApp
//
//  Created by Islam on 2/10/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    @IBOutlet var userTotalRatingLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var callButton: UIButton!

    var object: Business?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func callButtonTapped(_ sender: UIButton) {
        object!.phoneNumber!.makeACall()
    }
    
    func configureCell(business: Business) {

        self.object = business

        let type = business.types.filter { $0 == "car_rental" || $0 == "lodging" }.first
        self.typeLabel.text = type ?? "Other"

        if let _ = business.phoneNumber {
            callButton.isHidden = false
        } else {
            callButton.isHidden = true
        }

        self.addressLabel.text = business.formattedAddress ?? business.description
        if let rating = business.rating {
            self.ratingLabel.isHidden = false
            self.ratingLabel.text = "\(rating)"
        } else {
            self.ratingLabel.isHidden = true
        }

        if let totalRating = business.totalRating {
            self.userTotalRatingLabel.isHidden = false
            self.userTotalRatingLabel.text = "\(totalRating)"
        } else {
            self.userTotalRatingLabel.isHidden = true
        }
    }
    
}
