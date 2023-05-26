//
//  SettingsView.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    @State var languageIsSet = true
    
    
    
    var body: some View {
        VStack{
            HStack{
                Picker("Language", selection: $settings.language){
                    Text("Spanish").tag(Language.Spanish)
                    Text("English").tag(Language.English)
                }
                .pickerStyle(.segmented)
                
                Text(LangTools.get(language: settings.language).Flag)
                    .frame(width: 40, height: 40)
                    .scaleEffect(x:2, y:2)
                    .padding()
            }
            .frame(width: 350)
            .padding(.top, 0)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(Settings())
    }
}
