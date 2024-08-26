//
//  DiscoverItemCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import UIKit

class DiscoverItemCell: UICollectionViewCell {
    static let identifier = "DiscoverItemCell"
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear

    }
    
    func configureCell(with cellData: DummyDataModel) {
        placeImage.image = cellData.bannerImage
        placeLabel.text = cellData.name
    }

}
