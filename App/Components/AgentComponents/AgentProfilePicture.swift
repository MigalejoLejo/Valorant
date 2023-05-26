//
//  AgentProfilePicture.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentProfilePicture: View {
    @Binding var agent:Agent
    var body: some View {
        VStack{
            
        }
        .background(
            ZStack{
                AsyncImage(url: URL(string: agent.background ?? "")){ image in
                        image
                            .colorMultiply(agent.getColor(at: 2).opacity(0.03))
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()

                
               
                AsyncImage(url: URL(string: agent.fullportrait ?? "https://media.valorant-api.com/agents/" + agent.uuid + "/fullportrait.png")){ image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
            
                
                
                
            }
           
            )
        .frame(width: 300, height: 550)
    }
}

struct AgentProfilePicture_Previews: PreviewProvider {
    @State static var agent:Agent = Dummy.dummyAgent
    static var previews: some View {
        AgentProfilePicture(agent: $agent)
    }
}
