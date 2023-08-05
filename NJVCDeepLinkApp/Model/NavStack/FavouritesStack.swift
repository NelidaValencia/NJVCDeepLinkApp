//
//  FavouritesStack.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

enum FavouritesStack : String, CaseIterable {
    case favorite1 = "favorite1"
    case favorite2 = "favorite2"
    case favorite3 = "favorite3"
    
    static func convert(from: String) -> Self?{
        return self.allCases.first{ tab in
            tab.rawValue.lowercased() == from.lowercased()
            
        }
    }
}
