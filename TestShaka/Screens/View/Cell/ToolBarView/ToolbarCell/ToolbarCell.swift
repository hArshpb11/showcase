//
//  ToolbarCell.swift
//  TestShaka
//
//  Created by hArsh Rajput on 26/04/24.
//

import UIKit

class ToolbarCell: UITableViewCell {
    static let identifier = "ToolbarCell"
    private var toolsNameDummyData: [DummyDataModel] = []
    @IBOutlet weak var toolsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .clear
        collectionViewConfiguration()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(with toolsData: [DummyDataModel]) {
        toolsNameDummyData = toolsData
        
    }
    private func collectionViewConfiguration() {
        let columnLayout = CustomCollectionViewFlowLayout()
        columnLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        toolsCollectionView.collectionViewLayout = columnLayout
        toolsCollectionView.allowsMultipleSelection = true
        toolsCollectionView.backgroundColor = .clear
        toolsCollectionView.dataSource = self
        toolsCollectionView.delegate = self
        toolsCollectionView.register(UINib(nibName: ToolItemCell.identifier, bundle: .main),
                                          forCellWithReuseIdentifier: ToolItemCell.identifier)
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ToolbarCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toolsNameDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolItemCell.identifier,
                                                      for: indexPath) as! ToolItemCell
        cell.configureCellView(with: toolsNameDummyData[indexPath.item].name,
                               icon: toolsNameDummyData[indexPath.item].bannerImage)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = toolsNameDummyData[indexPath.item].name
        label.sizeToFit()
        return CGSize(width: label.frame.width + 55, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ToolItemCell {
            cell.isToolSelected.toggle()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ToolItemCell {
            cell.isToolSelected.toggle()
        }
    }
}
