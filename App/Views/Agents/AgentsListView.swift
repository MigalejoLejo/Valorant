//
//  AgentViewList.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

struct AgentsListView: View {
    
    @EnvironmentObject var agentsService: AgentsService
    
    @State var agents: [Agent] = []
    @State var isHidden = false
    @State var showFavorites = false
    
    var valorantFont: String = VFonts.Valorant.rawValue

    
    // INIT for custom TitleBar
    init() {
            // this is not the same as manipulating the proxy directly
            let appearance = UINavigationBarAppearance()
            
            // this overrides everything you have set up earlier.
            appearance.backgroundColor = UIColor.white
            appearance.shadowColor = UIColor.clear
        
        
            // this only applies to big titles
            appearance.largeTitleTextAttributes = [
                .font : UIFont(name: valorantFont, size: 40) ?? UIFont.systemFont(ofSize: 40),
                .foregroundColor : UIColor.black,
            ]
            // this only applies to small titles
            appearance.titleTextAttributes = [
                .font :  UIFont(name: valorantFont, size: 20) ?? UIFont.systemFont(ofSize: 20),
                .foregroundColor : UIColor.black,
            ]
            
            //In the following two lines you make sure that you apply the style for good
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().standardAppearance = appearance
            
            // This property is not present on the UINavigationBarAppearance
            // object for some reason and you have to leave it til the end
            UINavigationBar.appearance().tintColor = .white
            
        }
    
    
    var body: some View {
        ZStack{
            NavigationView{
                ScrollView{
                    HStack (alignment: .center){
                        Toggle(LocalizedStringKey("show_favorites_only"), isOn: $showFavorites)
                    }
                    .font(.custom(valorantFont, size: 15))
                    .padding(.horizontal,30)
                    .padding(.top,15)
                    
                    
                    ForEach($agents, id: \.uuid) { agent in
                        NavigationLink(destination: AgentView(agent: agent, isHidden: $isHidden)){
                            if showFavorites {
                                if agentsService.isFavoriteAgent(id:agent.wrappedValue.uuid){
                                    AgentListCard(agent: agent)
                                }
                            }else {
                                AgentListCard(agent: agent)
                                
                            }
                        }
                        .padding(.vertical,5)
                    }
                }
                .navigationTitle(LocalizedStringKey("agents_title"))
                .onAppear{
                    if agents.isEmpty{
                        if agents.isEmpty {
                            callAgents()
                        }
                    }
                }
                
                
                
                if UIDevice.current.localizedModel == "iPhone" {
                    
                } else if UIDevice.current.localizedModel == "iPad" {
                    iPadWelcome_Agents()
                        
                }
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
        })
    }
}

struct AgentsListView_Previews: PreviewProvider {
    static var previews: some View {
        AgentsListView()
            .environmentObject(AgentsService())
        
    }
}

