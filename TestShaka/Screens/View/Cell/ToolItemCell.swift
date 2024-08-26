//
//  ToolItemCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 26/04/24.
//

import UIKit

class ToolItemCell: UICollectionViewCell {
    static let identifier = "ToolItemCell"

    @IBOutlet weak var toolIconImage: UIImageView!
    @IBOutlet weak var toolTitleLabel: UILabel!
    @IBOutlet weak var toolBGView: UIView!
    
    var isToolSelected: Bool = false {
        didSet {
            toolTitleLabel.textColor = isToolSelected ? .white : AppColors.appPrimaryColor
            toolBGView.backgroundColor = isToolSelected ? AppColors.appPrimaryColor : AppColors.bgToolUnSelectedColor
            toolIconImage.tintColor = toolTitleLabel.textColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        configureCellView()
    }

    func configureCellView() {
        toolBGView.cornerRadius = 14
        isToolSelected = false
    }
    
    func configureCellView(with toolTitle: String, icon: UIImage?) {
        toolTitleLabel.text = toolTitle
        toolIconImage.image = icon
        toolIconImage.isHidden = icon == nil
    }
    
    
}
