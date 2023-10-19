//
//  SkinsList.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct SkinItem: View {
    var skinName: String
    var skinIcon: String
    var valorantFont: String = VFonts.Valorant.rawValue


    
    var body: some View {
        
        
        
        ZStack{
            VStack{
                HStack{
                    AsyncImage(url: URL(string: skinIcon)){ image in
                        image.resizable().scaledToFit()
                        
                    } placeholder: {
                        Image(systemName: "questionmark.square")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                HStack{
                    Text(skinName)
                        .font(.custom(valorantFont, size: 15))
                        .frame(height: 20)

                    Spacer()

                }
            }
            .frame(maxWidth: .infinity)
            
        }
        .padding(10)
        .background(.white)
        .cornerRadius(10)
        
    }
}

struct WeaponSkinItem_Previews: PreviewProvider {
    static var skinName:String = (Dummy.dummyWeapon.skins?[0].displayName ?? "")
    static var skinIcon: String = Dummy.dummyWeapon.displayIcon ?? ""
    
   
    static var previews: some View {

        SkinItem(skinName: skinName, skinIcon: skinIcon)
    }
}


struct TabNavigator2_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigator()
            .environmentObject(AgentsService())
    }
}
