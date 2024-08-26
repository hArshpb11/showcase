//
//  HomeController.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var tourTableView: UITableView!
    
    private let vm = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        tableConfiguration()
        serverRequested()
    }

    private func serverRequested() {
        vm.requestServerSectionRecordes {
            tourTableView.reloadData()
        }
    }
    
    private func viewConfiguration() {
        
    }
    
    private func tableConfiguration() {
        tourTableView.dataSource = self
        tourTableView.delegate = self
        tourTableView.register(UINib(nibName: ToolbarCell.identifier, bundle: .main),
                               forCellReuseIdentifier: ToolbarCell.identifier)
        tourTableView.register(UINib(nibName: RecentlyViewedCell.identifier, bundle: .main),
                               forCellReuseIdentifier: RecentlyViewedCell.identifier)
        tourTableView.register(UINib(nibName: WhatsNewCell.identifier, bundle: .main),
                               forCellReuseIdentifier: WhatsNewCell.identifier)
        tourTableView.register(UINib(nibName: DiscoverCell.identifier, bundle: .main),
                               forCellReuseIdentifier: DiscoverCell.identifier)
        tourTableView.register(UINib(nibName: FooterButtonView.identifier, bundle: .main),
                               forHeaderFooterViewReuseIdentifier: FooterButtonView.identifier)
        tourTableView.register(UINib(nibName: TitleAndFooterView.identifier, bundle: .main),
                               forHeaderFooterViewReuseIdentifier: TitleAndFooterView.identifier)
        tourTableView.backgroundColor = .clear
    }

}

// MARK: - UITableViewDataSource
extension HomeController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vm.getNumberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = vm.getTypeForSection(section: section)
        switch sectionType {
        case .whatsNew, .currentPromotion, .findAudioToursFor:
            return vm.getDetailDataForSection(section: section).count
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = vm.getTypeForSection(section: indexPath.section)
        switch sectionType {
        case .noneOne:
            let cell = tableView.dequeueReusableCell(withIdentifier: ToolbarCell.identifier,
                                                     for: indexPath) as! ToolbarCell
            cell.configureCell(with: vm.getDetailDataForSection(section: indexPath.section))
            return cell
        case .recentlyViewed:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentlyViewedCell.identifier,
                                                     for: indexPath) as! RecentlyViewedCell
            cell.configuration(with: vm.getSectionDataForSection(section: indexPath.section))
            cell.configuration(for: .horizontal)

            return cell
        case .whatsNew, .currentPromotion, .findAudioToursFor, .whoAreWe:
            let cell = tableView.dequeueReusableCell(withIdentifier: WhatsNewCell.identifier,
                                                     for: indexPath) as! WhatsNewCell
            cell.configureCell(with: vm.getDetailDataForSection(section: indexPath.section)[indexPath.item])
            return cell
        case .discover:
            let cell = tableView.dequeueReusableCell(withIdentifier: DiscoverCell.identifier,
                                                     for: indexPath) as! DiscoverCell
            cell.configureCell(with: vm.getSectionDataForSection(section: indexPath.section))
            return cell
        case.dayTripsAndRoadTrips:
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentlyViewedCell.identifier,
                                                     for: indexPath) as! RecentlyViewedCell
            cell.configuration(with: vm.getSectionDataForSection(section: indexPath.section))
            cell.configuration(for: .vertical)

            return cell
        }
    }
    
    // Configure Header and Footer for sections
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleAndFooterView.identifier) as! TitleAndFooterView
        let sectionName =  vm.getTitleForSection(section: section)
        header.sectionTitleLabel.text = sectionName
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionType = vm.getTypeForSection(section: section)
        
        switch sectionType {
        case .dayTripsAndRoadTrips:
            let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: FooterButtonView.identifier) as! FooterButtonView
            footer.configureFooter()
            return footer
        default:
            return UIView(frame: .zero)

        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionType = vm.getTypeForSection(section: section)
        switch sectionType {
        case .noneOne :
            return .zero
        default:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionType = vm.getTypeForSection(section: section)
        switch sectionType {
        case .dayTripsAndRoadTrips:
            return 50
        default:
            return .zero
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = vm.getTypeForSection(section: indexPath.section)
        
        switch sectionType {
        case .noneOne:
            return 80.0
        case .recentlyViewed, .discover:
            return 170.0
        case .whatsNew, .currentPromotion, .findAudioToursFor, .whoAreWe:
            return 190.0

        case .dayTripsAndRoadTrips:
            return 490.0
        }
    }
}
