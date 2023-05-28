//
//  AgentViewList.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

struct AgentsListView: View {
    
    private let agentsService = AgentsService()
    
    @EnvironmentObject var settings: Settings
    
    @State var agents: [Agent] = []
    @State var isHidden = false
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Text(LangTools.get(language: settings.language).Agents)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    ContentFlag(language: $settings.language)
                }
                .padding(.horizontal,30)
                
                
                ForEach($agents, id: \.uuid) { agent in
                    NavigationLink(destination: AgentView(agent: agent, isHidden: $isHidden)){
                        AgentListCard(agent: agent)
                    }
                    .padding(.vertical,5)
                }
                
                
            }
            .onChange(of: settings.language, perform: { newValue in
                callAgents()
            })
            
            .onAppear{
                if agents.isEmpty{
                    callAgents()
                }
                showBack()
            }  
        }
    }
    
    
    func callAgents(){
        agentsService.getAgents(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let agents):
                    self.agents = agents.data
                case .failure(let error):
                    print("there was a problem with the call")
                    print(error)
                }
            }
        }, language: settings.language)
    }
    
    func hideBack () {
        isHidden = true
    }
    func showBack () {
        isHidden = false
    }
    
    
    
}

struct AgentsListView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsListView()
            .environmentObject(Settings())
    }
}

