//
//  AppData.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var activeTab : Tab = .home
    @Published var homeNavStack: [HomeStack] = []
    @Published var favouriteNavStack: [FavouritesStack] = []
    @Published var settingsNavStack: [SettingsStack] = []
}
