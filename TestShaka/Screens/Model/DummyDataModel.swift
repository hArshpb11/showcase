//
//  DummyDataModel.swift
//  TestShaka
//
//  Created by hArsh Rajput on 26/04/24.
//

import Foundation
import UIKit




struct SectionDummyDataModel {
    let sectionType: HomeSections
    let sectionDate: [DummyDataModel]
}
struct DummyDataModel {
    let name: String
    let bannerImage: UIImage?
}


struct AppDummyDataModel {
    
    
    private func getFirstSectionData() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .noneOne,
                                                     sectionDate: [
                                                        DummyDataModel(name: "Home", bannerImage: nil),
                                                        DummyDataModel(name: "Hawaii", bannerImage: nil),
                                                        DummyDataModel(name: "National Parks", bannerImage: nil),
                                                        DummyDataModel(name: "All Tours", bannerImage: nil),
                                                        DummyDataModel(name: "Bundles", bannerImage: nil),
                                                        DummyDataModel(name: "Map", bannerImage: UIImage(named: "icLocation"))
                                                     ])
        return sectionData
    }
    
    
    
    private func getSecondSectionDate() -> SectionDummyDataModel {
        
        let sectionData = SectionDummyDataModel.init(sectionType: .recentlyViewed,
                                                     sectionDate: [
                                                        DummyDataModel(name: "Denali National Park", bannerImage: UIImage(named: "icMaskRecentView1")),
                                                        DummyDataModel(name: "Gates of the Arctic National Park", bannerImage: UIImage(named: "icMaskRecentView2")),
                                                        DummyDataModel(name: "Blue Ridge + Appalachia", bannerImage: UIImage(named: "icMaskRecentView3"))
                                                     ])
        return sectionData
    }
    
    private func getThirdSectionDate() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .whatsNew,
                                                     sectionDate: [
                                                        DummyDataModel(name: "", bannerImage: UIImage(named: "icMaskWhatsNew1")),
                                                        DummyDataModel(name: "", bannerImage: UIImage(named: "icMaskWhatsNew2"))
                                                     ])
        return sectionData
    }
    
    private func getForthSectionDate() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .currentPromotion,
                                                     sectionDate: [
                                                        DummyDataModel(name: "", bannerImage: UIImage(named: "icPromotion")),
                                                     ])
        return sectionData
    }
    
    private func getFifthSectionDate() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .findAudioToursFor,
                                                     sectionDate: [
                                                        DummyDataModel(name: "", bannerImage: UIImage(named: "icMaskAudioTours1")),
                                                        DummyDataModel(name: "", bannerImage: UIImage(named: "icMaskAudioTours2")),
                                                     ])
        return sectionData
    }
    
    private func getSixthSectionDate() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .discover,
                                                     sectionDate: [
                                                        DummyDataModel(name: "All Tours", bannerImage: UIImage(named: "icMaskDiscover1")),
                                                        DummyDataModel(name: "Nearby Tours", bannerImage: UIImage(named: "icMaskDiscover2")),
                                                     ])
        return sectionData
    }
    
    private func getSeventhSectionDate() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .dayTripsAndRoadTrips,
                                                     sectionDate: [
                                                        DummyDataModel(name: "Las Vegas \nDay Trips", bannerImage: UIImage(named: "icDayTripsAndRoadTrips1")),
                                                        DummyDataModel(name: "Tuscon \nDay Trips", bannerImage: UIImage(named: "icDayTripsAndRoadTrips2")),
                                                        DummyDataModel(name: "Utah Mighty 5", bannerImage: UIImage(named: "icDayTripsAndRoadTrips3")),
                                                        DummyDataModel(name: "California Road Trip", bannerImage: UIImage(named: "icDayTripsAndRoadTrips4")),
                                                        DummyDataModel(name: "Yellowstone\n + Teton ", bannerImage: UIImage(named: "icMaskRecentView1")),
                                                        DummyDataModel(name: "Blue Ridge + \nAppalachia", bannerImage: UIImage(named: "icMaskRecentView2"))
                                                     ])
        return sectionData
    }
    
    private func getEighthSectionDate() -> SectionDummyDataModel {
        let sectionData = SectionDummyDataModel.init(sectionType: .whoAreWe,
                                                     sectionDate: [
                                                        DummyDataModel(name: "", bannerImage: UIImage(named: "icWeAre")),
                                                     ])
        return sectionData
    }
    
    func fetchSectionRecords() -> [SectionDummyDataModel] {
        var dummyResponse: [SectionDummyDataModel] = []
        dummyResponse.append(getFirstSectionData())
        dummyResponse.append(getSecondSectionDate())
        dummyResponse.append(getThirdSectionDate())
        dummyResponse.append(getForthSectionDate())
        dummyResponse.append(getFifthSectionDate())
        dummyResponse.append(getSixthSectionDate())
        dummyResponse.append(getSeventhSectionDate())
        dummyResponse.append(getEighthSectionDate())
        return dummyResponse
    }
}
