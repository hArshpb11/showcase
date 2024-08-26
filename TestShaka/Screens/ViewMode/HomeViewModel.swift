//
//  HomeViewModel.swift
//  TestShaka
//
//  Created by hArsh Rajput on 25/04/24.
//

import Foundation

class HomeViewModel {
    
    private var sectionDetails: [SectionDummyDataModel] = []
    
    
    func getNumberOfSection() -> Int {
        return sectionDetails.count
    }
    
    func getTitleForSection(section: Int) -> String {
        return sectionDetails[section].sectionType.sectionRawValue
    }
    
    func getTypeForSection(section: Int) -> HomeSections {
        return sectionDetails[section].sectionType
    }
    
    func getDetailDataForSection(section: Int) -> [DummyDataModel] {
        return sectionDetails[section].sectionDate
    }
    
    func getSectionDataForSection(section: Int) -> SectionDummyDataModel {
        return sectionDetails[section]
    }
    
    func requestServerSectionRecordes(on completion: () -> Void ) {
        let appDataModel =  AppDummyDataModel()
        sectionDetails = appDataModel.fetchSectionRecords()
        return completion()
    }
}
