//
//  LocationCell.swift
//  CallingApp
//
//  Created by Islam on 2/9/20.
//  Copyright © 2020 App Lineup. All rights reserved.
//

import UIKit
import MapKit

class LocationCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(business: Business) {

        if let geometry = business.geometry {
            let location = CLLocationCoordinate2D(latitude: geometry.location.latitude,
                                                  longitude: geometry.location.longitude)

            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            self.mapView.addAnnotation(annotation)

            self.mapView.cameraZoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 10)
            self.mapView.setCenter(location, animated: true)
        }
    }
}
