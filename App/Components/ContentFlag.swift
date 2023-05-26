//
//  ContentFlag.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct ContentFlag: View {
    @Binding var language:Language
    
    var body: some View {
        Text(LangTools.get(language: language).Flag)
                .frame(width: 40, height: 40)
                .scaleEffect(x:2, y:2)
        
    }
}

struct ContentFlag_Previews: PreviewProvider {
    @State static var language:Language = .English
    
    static var previews: some View {
        ContentFlag(language: $language)
    }
}
