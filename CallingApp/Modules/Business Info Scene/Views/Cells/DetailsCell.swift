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
    @IBOutlet var callStackView: UIStackView!
    @IBOutlet var callButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(business: Business) {

        let type = business.types.filter { $0 == "car_rental" || $0 == "lodging" }.first
        self.typeLabel.text = type ?? "Other"

        guard let _ = business.phoneNumber else {
            callButton.isHidden = true
            callStackView.isHidden = true
            return
        }

        self.addressLabel.text = business.formattedAddress ?? business.name
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
