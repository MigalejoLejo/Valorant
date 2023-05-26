//
//  TabNavigator.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct TabNavigator: View {
    @EnvironmentObject var settings: Settings
    
    var body: some View {
        TabView {
            AgentsListView()
                .tabItem {
                    Label(LangTools.get(language: settings.language).Agents, systemImage: "person.3")
                }
            
            WeaponsListView()
                .tabItem {
                    Label(LangTools.get(language: settings.language).Weapons, systemImage: "gamecontroller")
                }
            
            SettingsView()
                .tabItem {
                    Label(LangTools.get(language: settings.language).Settings, systemImage: "gearshape")
                }
            
        
        }
        
    }
}

struct TabNavigator_Previews: PreviewProvider {

    var settings:Settings = Settings()
    
    static var previews: some View {
        TabNavigator()
            .environmentObject(Settings())
    }
}
