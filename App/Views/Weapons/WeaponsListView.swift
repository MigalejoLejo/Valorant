//
//  WeaponsListView.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

struct WeaponsListView: View {
    
    private let weaponsService = WeaponsService()
        
    @State var weapons: [Weapon] = []
    @State var isHidden = false

    let valorantFont = VFonts.Valorant.rawValue
    
//     INIT for custom TitleBar
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
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance


            // This property is not present on the UINavigationBarAppearance
            // object for some reason and you have to leave it til the end
            UINavigationBar.appearance().tintColor = .white

        }
    
    
    var body: some View {
        
        ZStack{
            
            NavigationView{
                ScrollView{
                    HStack{}
                    ForEach($weapons, id: \.uuid) { weapon in
                        NavigationLink(destination: WeaponView(weapon: weapon, isHidden: $isHidden)){
                            WeaponListCard(weapon: weapon)
                        }
                        .padding(.vertical,5)
                    }
                }
                
                .navigationTitle(LocalizedStringKey("weapons_title"))
                
                
                .onAppear{
                    if weapons.isEmpty{
                        callWeapons()
                    }
                }
                
                if UIDevice.current.localizedModel == "iPhone" {
                    
                } else if UIDevice.current.localizedModel == "iPad" {
                    iPadWelcome_Weapons()
                    
                }
            }
            .navigationBarBackButtonHidden(isHidden)
            
           
           
            
            
        }
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
        })
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
    }
}
