//
//  AgentProfilePicture.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentProfilePicture: View {
    @Binding var agent:Agent
    @EnvironmentObject var agentsService: AgentsService
    
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
            
                VStack{
                    HStack{
                        Spacer()
                        Image(systemName: agentsService.isFavoriteAgent(id: agent.uuid) ?  "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(agentsService.isFavoriteAgent(id: agent.uuid) ? .yellow : .gray)
                    }
                    Spacer()
                }
                .frame(width: 300, height: 550)
                .onTapGesture {
                    if agentsService.isFavoriteAgent(id: agent.uuid){
                        agentsService.removeFavoriteAgent(by: agent.uuid)
                    } else {
                        agentsService.addFavoriteAgent(by: agent.uuid)
                    }
                }
                
                
                
            }
           
            )
        .frame(width: 300, height: 550)
    }
}

struct AgentProfilePicture_Previews: PreviewProvider {
    @State static var agent:Agent = Dummy.dummyAgent
    static var previews: some View {
        AgentProfilePicture(agent: $agent)
            .environmentObject(AgentsService())
    }
}
