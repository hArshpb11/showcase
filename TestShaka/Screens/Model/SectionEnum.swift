//
//  SectionEnum.swift
//  TestShaka
//
//  Created by hArsh Rajput on 26/04/24.
//

import Foundation
enum HomeSections: String {
    case noneOne
    case recentlyViewed
    case whatsNew
    case currentPromotion
    case findAudioToursFor
    case discover
    case dayTripsAndRoadTrips
    case whoAreWe
    
    var sectionRawValue: String {
        switch self {
        case .noneOne:
            return ""
        case .recentlyViewed:
            return "Recently Viewed"
        case .whatsNew:
            return "What’s New?"
        case .currentPromotion:
            return "Current Promotion"
        case .findAudioToursFor:
            return "Find Audio Tours for"
        case .discover:
            return "Discover"
        case .dayTripsAndRoadTrips:
            return "Day Trips & Road Trips"
        case .whoAreWe:
            return "Who are we?"
            
        }
    }
}
