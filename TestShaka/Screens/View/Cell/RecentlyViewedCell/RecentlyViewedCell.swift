//
//  RecentlyViewedCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import UIKit

class RecentlyViewedCell: UITableViewCell {
    static let identifier = "RecentlyViewedCell"
    @IBOutlet weak var viewPlacesCollectionView: UICollectionView!
    private var sectionDummyDataModel: SectionDummyDataModel? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewConfiguration()
        backgroundColor = .clear
    }
    
    func configuration(for direction: UICollectionView.ScrollDirection) {
        if let layout = viewPlacesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = direction
            }

    }
    func configuration(with sectionData: SectionDummyDataModel) {
        sectionDummyDataModel = sectionData
        viewPlacesCollectionView.reloadData()
        
    }
    
    private func collectionViewConfiguration() {
        viewPlacesCollectionView.backgroundColor = .clear
        viewPlacesCollectionView.dataSource = self
        viewPlacesCollectionView.delegate = self
        viewPlacesCollectionView.register(UINib(nibName: RoadTripCell.identifier, bundle: .main),
                                          forCellWithReuseIdentifier: RoadTripCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension RecentlyViewedCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionDummyDataModel?.sectionDate.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoadTripCell.identifier,
                                                      for: indexPath) as! RoadTripCell
        if let dataAvailable = sectionDummyDataModel?.sectionDate[indexPath.item],
           let sectionType = sectionDummyDataModel?.sectionType {
            cell.configureCall(with: dataAvailable,sectionType: sectionType)
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let sectionType = sectionDummyDataModel?.sectionType {
            if sectionType == .dayTripsAndRoadTrips {
                return CGSize(width: collectionView.frame.width / 2.1, height: 160)
            } else if sectionType == .dayTripsAndRoadTrips {
                return CGSize(width: collectionView.frame.width / 2, height: 160)
            }else {
                return CGSize(width: 150, height: 160)
            }
        } else {
            return CGSize(width: 150, height: 160)
        }
    }
}
