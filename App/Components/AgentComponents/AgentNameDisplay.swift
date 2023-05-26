//
//  AgentNameDisplay.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentNameDisplay: View {
    @Binding var agent:Agent
    var body: some View {
       
            VStack (alignment: .center){
                Text("Agent")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding(.bottom, 0)
                Text(agent.displayName)
                    .font(.system(size: 50, weight: .bold, design: .default))
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
