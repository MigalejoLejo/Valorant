//
//  SkinsList.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponSkinItem: View {
    var skinName: String
    var skinIcon: String

    
    var body: some View {
       
        ZStack{
            VStack{
                HStack{
                    AsyncImage(url: URL(string: skinIcon)){ image in
                        image.resizable().scaledToFit()
                        
                    } placeholder: {
                        Image(systemName: "questionmark.square.dashed")
                            .resizable()
                            .scaledToFit()
                    }
                    .padding(.top, 5)
                    .padding(.leading, 40)

                }
                Spacer()
            }
           
            VStack{
                Spacer()
                HStack{
                    Text(skinName)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .padding(10)
                        .foregroundColor(.pink)
                    Spacer()
                }
            }

        }
        .frame(width: 230, height: 90)
        .background(.white)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct WeaponSkinItem_Previews: PreviewProvider {
    static var skinName:String = (Dummy.dummyWeapon.skins?[0].displayName ?? "")
    static var skinIcon: String = Dummy.dummyWeapon.displayIcon ?? ""
    
   
    static var previews: some View {

        WeaponSkinItem(skinName: skinName, skinIcon: skinIcon)
    }
}
