//
//  ListtAgentCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct AgentListCard: View {
    
    @Binding var agent:Agent
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ZStack{
                    Rectangle()
                        .frame(width: 350, height: 40)
                        .foregroundColor(agent.getColor(at:1 ))
                    
                    Text(agent.displayName)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(5)
                        .bold()
                }
            }
            .background(
                ZStack{
                    AsyncImage(url: URL(string: agent.displayIconSmall ?? ""), scale: 2){image in
                        image.scaledToFit()} placeholder: {}
                }
                    .frame(width: 350, height: 150)
                    .background(agent.getColor(at: 0).opacity(0.3))
            )                .shadow(color:.black.opacity(0.5), radius:10, x:10, y:10)

            .frame(width: 350, height: 150)
            
        }

        .frame(width: 350, height: 150)
        .cornerRadius(20)
        
    }
}


struct AgentListCard_Previews: PreviewProvider {
    @State static var agent:Agent = Dummy.dummyAgent
    
    static var previews: some View {
        AgentListCard(agent:$agent)
    }
}
