//
//  WhatsNewCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import UIKit

class WhatsNewCell: UITableViewCell {
static let identifier = "WhatsNewCell"
    @IBOutlet weak var placeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with data: DummyDataModel) {
        placeImage.image = data.bannerImage
    }
    
}
