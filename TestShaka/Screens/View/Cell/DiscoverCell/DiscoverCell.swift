//
//  DiscoverCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import UIKit

class DiscoverCell: UITableViewCell {
    static let identifier = "DiscoverCell"
    @IBOutlet weak var discoverPlacesCollectionView: UICollectionView!
    private var sectionDummyDataModel: SectionDummyDataModel? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewConfiguration()
        backgroundColor = .clear

    }
    func configureCell(with data: SectionDummyDataModel) {
        sectionDummyDataModel = data
    }
    
    private func collectionViewConfiguration() {
        discoverPlacesCollectionView.backgroundColor = .clear
        discoverPlacesCollectionView.dataSource = self
        discoverPlacesCollectionView.delegate = self
        discoverPlacesCollectionView.register(UINib(nibName: DiscoverItemCell.identifier, bundle: .main),
                                          forCellWithReuseIdentifier: DiscoverItemCell.identifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension DiscoverCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionDummyDataModel?.sectionDate.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverItemCell.identifier,
                                                      for: indexPath) as! DiscoverItemCell
        if let cellDataAvailable = sectionDummyDataModel?.sectionDate[indexPath.item] {
            cell.configureCell(with: cellDataAvailable)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.frame.width / 2
        return CGSize(width: itemWidth - 10 , height: 160)
    }
}
