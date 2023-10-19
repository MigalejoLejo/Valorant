//
//  TabNavigator.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct TabNavigator: View {
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: VFonts.Valorant.rawValue, size: 15)! ], for: .normal)
    }
    
    var body: some View {
        TabView {
            AgentsListView()
                .tabItem {
                    Label(LocalizedStringKey("agents_title"), systemImage: "person.3")
                        .font(Font.custom(VFonts.Valorant.rawValue, size: 50))
                }
                
            
            WeaponsListView()
                .tabItem {
                    Label(LocalizedStringKey("weapons_title"), systemImage: "gamecontroller")
                }
        }
        .foregroundColor(.pink)
    }
}

struct TabNavigator_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigator()
            .environmentObject(AgentsService())
    }
}
