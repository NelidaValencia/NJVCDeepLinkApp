//
//  NJVCDeepLinkAppApp.swift
//  NJVCDeepLinkApp
//
//  Created by Slacker on 3/05/23.
//

import SwiftUI

@main
struct NJVCDeepLinkAppApp: App {
    //State object, contains whole app data and presses it via enviroment object
    @State private var appData: AppData = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
            ///Called  when deep link was triggered
            ///Ir a configuracion de proyecto > Info > URL Types
            ///Con la funcion OpenURL se puede recuperar todo el enlace profundo y luego se puede actualizar la vista o navergar usando los componentes de URL.
                .onOpenURL { url in
                    let string = url.absoluteString.replacingOccurrences(of: "myapp://", with: "")
//                    print(string)
                    
                    let components = string.components(separatedBy: "?")
                    for component in components {
                        if component.contains("tab="){
                            // escribir en buscador web -->> myapp://tab=settings
                            let tabRawValue = component.replacingOccurrences(of: "tab=", with: "")
                            print(tabRawValue)
                        }
                        if component.contains("nav=") && string.contains("tab="){
                            // escribir en buscador web -->> myapp://tab=settings?nav=terms_of_service
                            let requestedNavPath = component
                                .replacingOccurrences(of: "nav=", with: "")
                                .replacingOccurrences(of: "_", with: " ") // Por que reemplazamos el guion bajo, debido a que los deeplink no pueden contener espacion, debido a que si se encuentra un espacio en una url esta se mostrara como guion bajo.
                            print(requestedNavPath)
                            
                            switch appData.activeTab{
                            case .home:
//                            myapp://tab=home?nav=My_Post
                                if let navpath = HomeStack.convert(from: requestedNavPath) {
                                    appData.homeNavStack.append(navpath)
                                }
                            case .favourites:
//                            myapp://tab=favourites?nav=favorite1
                                if let navpath = FavouritesStack.convert(from: requestedNavPath) {
                                    appData.favouriteNavStack.append(navpath)
                                }
                            case .settings:
//                            myapp://tab=settings?nav=setting4
                                if let navpath = SettingsStack.convert(from: requestedNavPath) {
                                    appData.settingsNavStack.append(navpath)
                                }
                            }
                            
                        }
                    }
                }
        }
    }
}
