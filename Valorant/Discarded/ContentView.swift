////
////  ContentView.swift
////  Valorant
////
////  Created by Miguel Alejandro Correa Avila on 24/5/23.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    
//    @EnvironmentObject var settings: Settings
//    @State var languageIsSet = true
//    
//    
//    
//  
//    var body: some View {
//        NavigationView {
//            
//            VStack{
//                HStack{
//                    Picker("Language", selection: $settings.language){
//                        Text("Spanish").tag(Language.Spanish)
//                        Text("English").tag(Language.English)
//                    }
//                    .pickerStyle(.segmented)
//                    
//                    Text(LangTools.getFlag(language: settings.language))
//                        .frame(width: 40, height: 40)
//                        .scaleEffect(x:2, y:2)
//                        .padding()
//                }
//                .frame(width: 350)
//                .padding(.top, 0)
//
//                
//                
//                VStack{
//                    NavigationLink (destination: AgentsListView()){
//                        NavigationButton(image:"agents", title:"Agents", color: .green)
//                    }
//                    .navigationBarBackButtonHidden()
//                    .frame(width: 350, height: 150)
//                    .cornerRadius(10)
//                    .padding()
//                    
//                    NavigationLink (destination: AgentsListView()){
//                        NavigationButton(image:"maps", title:"Maps", color: .orange)
//                    }
//                    .frame(width: 350, height: 150)
//                    .cornerRadius(10)
//                    .padding()
//                    
//                    NavigationLink (destination: WeaponsListView(language: $settings.language)){
//                        NavigationButton(image:"weapons", title:"Weapons", color: .indigo)
//                    }
//                    .frame(width: 350, height: 150)
//                    .cornerRadius(10)
//                    .padding()
//                    
//                }
//                .padding(.bottom, 40)
//
//                
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(.black.opacity(0.9))
//            
//            
//        }
//        
//    }
//    
//    
//    init() {
//        UISegmentedControl.appearance().selectedSegmentTintColor = .systemIndigo
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
//        UISegmentedControl.appearance().backgroundColor = .black
//
//    }
//    
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
//
