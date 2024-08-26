//
//  FooterButtonView.swift
//  TestShaka
//
//  Created by hArsh Rajput on 26/04/24.
//

import UIKit

class FooterButtonView: UITableViewHeaderFooterView {
    static let identifier = "FooterButtonView"
    @IBOutlet weak var moreTipsButton: UIButton!
    
    func configureFooter() {
        let btnColor = AppColors.appPrimaryColor
        moreTipsButton.cornerRadius = 10
        moreTipsButton.layer.borderColor = btnColor.cgColor
        moreTipsButton.layer.borderWidth = 2
        moreTipsButton.setTitle("Discover More Trips ", for: .normal)
        moreTipsButton.setTitleColor(btnColor, for: .normal)
    }
    

}
