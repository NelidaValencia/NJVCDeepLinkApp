//
//  HomeStack.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

enum HomeStack : String, CaseIterable {
    case myPost = "My Post"
    case oldPost = "Old Post"
    case latestPosts = "Latest Post"
    case deletedPost = "Delete Post"
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
