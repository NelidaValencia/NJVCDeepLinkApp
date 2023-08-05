//
//  Tab.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

// Tab View Tab's

enum Tab : String, CaseIterable {
    case home = "Home"
    case favourites = "Favourites"
    case settings = "Settings"
    
    var symbolImage : String {
        switch self {
        case .home:
            return "house.fill"
        case .favourites:
            return "heart.fill"
        case .settings:
            return "gear"
        }
    }
    
    static func convert(from: String) -> Self? {
        return Tab.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
    
}
