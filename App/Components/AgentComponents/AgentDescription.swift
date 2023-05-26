//
//  AgentDescription.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentDescription: View {
    @Binding var agent:Agent
    
    var body: some View {
        VStack{
            HStack{
                Text("Information")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(agent.getColor(at: 0))
                Spacer()
            }
            .padding(.bottom,10)
            
           
                Text(agent.description)
                    .font(.system(size: 20, weight: .light, design: .default))
            
        }.padding()
    }
}

struct AgentDescription_Previews: PreviewProvider {
    @State static var agent:Agent = Dummy.dummyAgent
    
    static var previews: some View {
        AgentDescription(agent: $agent)
    }
}
