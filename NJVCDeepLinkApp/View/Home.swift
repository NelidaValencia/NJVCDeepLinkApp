//
//  Home.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var appData: AppData
    var body: some View {
        TabView(selection: $appData.activeTab) {
            HomeView()
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: Tab.home.symbolImage)
                }
            
            FavouritesView()
                .tag(Tab.favourites)
                .tabItem {
                    Image(systemName: Tab.favourites.symbolImage)
                }
            
            SettingsView()
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: Tab.settings.symbolImage)
                }
        }
        .tint(.red)
    }
    
    // Home View with nav views
    @ViewBuilder
    func HomeView() -> some View {
        NavigationStack(path: $appData.homeNavStack){
            List{
                ForEach(HomeStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) {  link in
                ///Use Switch case to switch view for each enume case, I use a simple text
                Text(link.rawValue + " View")
            }
        }
    }
    
    // Favourites View with nav views
    @ViewBuilder
    func FavouritesView() -> some View {
        NavigationStack(path: $appData.favouriteNavStack){
            List{
                ForEach(FavouritesStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Favourites")
            .navigationDestination(for: FavouritesStack.self) {  link in
                ///Use Switch case to switch view for each enume case, I use a simple text
                Text(link.rawValue + " View")
            }
        }
    }
    // Settings View with nav views
    @ViewBuilder
    func SettingsView() -> some View {
        NavigationStack(path: $appData.settingsNavStack){
            List{
                ForEach(SettingsStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingsStack.self) {  link in
                ///Use Switch case to switch view for each enume case, I use a simple text
                Text(link.rawValue + " View")
            }
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData())
    }
}
