//
//  AgentNameDisplay.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentNameDisplay: View {
    let valorantFont: String = VFonts.Valorant.rawValue

    @Binding var agent:Agent
    var body: some View {
       
            VStack (alignment: .center){
                Text("Agent")
                    .font(.custom(valorantFont, size: 20))
                    .padding(.bottom, 0)
                Text(agent.displayName)
                    .font(.custom(valorantFont, size: 40))
                    .foregroundColor(agent.getColor(at: 0))
            }
        
    }
}

struct AgentNameDisplay_Previews: PreviewProvider {
    @State static var agent:Agent = Dummy.dummyAgent

    static var previews: some View {
        AgentNameDisplay(agent: $agent)
    }
}
