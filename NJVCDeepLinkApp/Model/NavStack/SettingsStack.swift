//
//  SettingsStack.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

enum SettingsStack : String, CaseIterable {
    case setting1 = "setting1"
    case setting2 = "setting2"
    case setting3 = "setting3"
    case setting4 = "setting4"
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
