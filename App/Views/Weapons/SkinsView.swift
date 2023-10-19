//
//  SkinsView.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 31/5/23.
//

import SwiftUI

struct SkinsView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var weapon:Weapon
    @Binding var displayIcon:String
    @Binding var stantardWeaponIcon: String
    @Binding var skinName:String
   
    var valorantFont: String = VFonts.Valorant.rawValue
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ZStack{
            
            VStack{
                HStack{
                    Text("Skins for \(skinName)")
                        .font(.custom(valorantFont, size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .onTapGesture {
                            dismiss()
                        }
                }
                .padding()
                
                ScrollView{
                    LazyVGrid(columns: columns, spacing: 5) {
                                ForEach (weapon.skins ?? [], id: \.uuid){ skin in
                                    SkinItem(
                                        skinName: getRightSkinName(fullSkinName: skin.displayName ?? ""),
                                        skinIcon: getSkinIcon(skin: skin))
                                    .onTapGesture {
                                        skinName = skin.displayName ?? ""
                                        if (skinName.contains("estándar") || skinName.contains("standard")) {
                                            displayIcon = stantardWeaponIcon
                                            print(displayIcon)
                                        } else {
                                            displayIcon = skin.displayIcon ?? ""
                                        }
                                        print("ok: " + skinName)
                                        dismiss()
                                    }
                                        
                                }
                            } .padding()
                               
                        
                    
                }
            }
            
        }.background(.pink)
    }
    
    
    func getRightSkinName (fullSkinName:String) -> String{
        let result = fullSkinName
        let toRemove = weapon.displayName + " - "

        if let range = result.range(of: toRemove) {
           skinName.removeSubrange(range)
        }
        return result
    }
    
    func getSkinIcon(skin:Skin) -> String{
        if let skinName = skin.displayName {
            if (skinName.contains("estándar") || skinName.contains("standard")) {
                return stantardWeaponIcon
            } else {
                return skin.displayIcon ?? ""
            }
        }
        return skinName
    }
        
    
    
}

struct SkinsView_Previews: PreviewProvider {
    @State static var weapon:Weapon = Dummy.dummyWeapon
    @State static var displayIcon = weapon.displayIcon ?? ""
    @State static var skinName = weapon.displayName
    static var previews: some View {
        SkinsView(weapon: $weapon, displayIcon: $displayIcon, stantardWeaponIcon: $displayIcon, skinName: $skinName)
    }
}
