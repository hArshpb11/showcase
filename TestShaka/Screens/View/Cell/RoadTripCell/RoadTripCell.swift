//
//  RoadTripCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import UIKit

class RoadTripCell: UICollectionViewCell {
    static let identifier = "RoadTripCell"
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear

    }
    
    func configureCall(with data: DummyDataModel, sectionType: HomeSections) {
        placeNameLabel.text = data.name
        placeImage.image = data.bannerImage
        if sectionType == .recentlyViewed {
            placeNameLabel.textAlignment = .left
        } else if sectionType == .dayTripsAndRoadTrips {
            placeNameLabel.textAlignment = .center
        }
    }

}
