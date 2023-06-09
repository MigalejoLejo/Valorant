//
//  WeaponsListView.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

struct WeaponsListView: View {
    
    private let weaponsService = WeaponsService()
    
    @EnvironmentObject var settings: Settings
    
    @State var weapons: [Weapon] = []
    @State var isHidden = false
    
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    Text(LangTools.get(language: settings.language).Weapons)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    ContentFlag(language: $settings.language)
                }
                .padding(.horizontal,30)
                ForEach($weapons, id: \.uuid) { weapon in
                    NavigationLink(destination: WeaponView(weapon: weapon, isHidden: $isHidden )){
                        WeaponListCard(weapon: weapon)
                    }
                }
            }
            .background(
                Image("camouflage")
                    .resizable()
                    .rotationEffect(.degrees(90))
                    .scaledToFill()
                    .blur(radius: 10))
            
            .onAppear{
                if weapons.isEmpty{
                    callWeapons()
                }
            }
        }
        .navigationBarBackButtonHidden(isHidden)
    }
    
    
    
    func callWeapons(){
        weaponsService.getWeapons(completion: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weapons):
                    self.weapons = weapons.data
                case .failure(let error):
                    print("Weapons: there was a problem with the call")
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

struct WeaponsListView_Previews: PreviewProvider {
    static var previews: some View {
        WeaponsListView()
            .environmentObject(Settings())
    }
}
