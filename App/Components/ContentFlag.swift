//
//  ContentFlag.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct ContentFlag: View {
    
    var body: some View {
        Text(LocalizedStringKey("flag_icon"))
                .frame(width: 40, height: 40)
                .scaleEffect(x:2, y:2)
        
    }
}

struct ContentFlag_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentFlag()
    }
}
