//
//  AgentView.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

struct AgentView: View {
    
    @Binding var agent:Agent
    @Binding var isHidden:Bool
    
    var body: some View {
        ScrollView {
            VStack{
                
                
                // Agent name
                AgentNameDisplay(agent: $agent)
                    .padding()
                
                
                // Portrait Picture
                AgentProfilePicture(agent: $agent)
                
                
                // Description
                AgentDescription(agent: $agent)
                    .padding(.top, 10)
               
            }
        }
        .onAppear{
            isHidden = true
        }
    }
}


struct AgentView_Previews: PreviewProvider {
    @State static var testAgent:Agent = Dummy.dummyAgent
    @State static var testBool:Bool = false

    static var previews: some View {
        AgentView(agent: $testAgent, isHidden: $testBool)
            .environmentObject(AgentsService())
    }
}
