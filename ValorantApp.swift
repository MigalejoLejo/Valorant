//
//  ValorantApp.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

@main
struct ValorantApp: App {
    
    @StateObject var settings:Settings = Settings()
    
    
    
    var body: some Scene {
        WindowGroup {
            TabNavigator()
                .environmentObject(settings)
        }
    }
}
