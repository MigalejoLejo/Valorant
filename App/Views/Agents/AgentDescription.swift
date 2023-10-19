//
//  AgentDescription.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentDescription: View {
    @Binding var agent:Agent
    
    let valorantFont: String = VFonts.Valorant.rawValue
    
    var body: some View {
        VStack{
            HStack{
                Text("Information")
                    .font(.custom(valorantFont, size: 40))
                    .foregroundColor(agent.getColor(at: 0))
                Spacer()
            }
            .padding(.bottom,10)
            
           
                Text(agent.description)
                .font(.custom(VFonts.Russo.rawValue, size: 22))
                .foregroundColor(.black.opacity(0.8))

        }.padding()
    }
}

struct AgentDescription_Previews: PreviewProvider {
    @State static var agent:Agent = Dummy.dummyAgent
    
    static var previews: some View {
        AgentDescription(agent: $agent)
    }
}
