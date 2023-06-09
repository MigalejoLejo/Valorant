//
//  WeaponView.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import SwiftUI

struct WeaponView: View {
    
    @Binding var weapon:Weapon
    @State var displayIcon:String = ""
    @State var skinName:String = ""

    
    @Binding var isHidden:Bool
    @State var isFlipped = false
    
    var body: some View {
        VStack{
            
            ZStack{
                if !isFlipped {
                    WeaponFrontCard(weapon: $weapon, displayIcon: $displayIcon, skinName: $skinName)
                } else {
                    WeaponBackCard(weapon: $weapon)
                        .rotation3DEffect(Angle(degrees:self.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                }
            }
            .frame(width: 350, height: 450)
            .rotation3DEffect(Angle(degrees:self.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            .onTapGesture {
                withAnimation(.spring()) {
                    isFlipped.toggle()
                }
            }
            .onAppear{
                isHidden = true
            }
            
            
            ScrollView(.horizontal){
                HStack{
                    ForEach (weapon.skins ?? [], id: \.uuid){ skin in
                       WeaponSkinItem(skinName: skin.displayName ?? "", skinIcon: skin.displayIcon ?? "")
                            .onTapGesture {
                                displayIcon = skin.displayIcon ?? ""
                                skinName = skin.displayName ?? ""
                            }
                        
                    }
                }
            }
            
            
        }
        .background(
            Image("camouflage")
                .resizable()
                .rotationEffect(.degrees(90))
                .scaledToFill()
                .blur(radius: 10))
        
    }
}


struct WeaponView_Previews: PreviewProvider {
    
    @State static var weapon:Weapon = Dummy.dummyWeapon
    
    static var previews: some View {
        @State var testBool:Bool = false
        WeaponView(weapon: $weapon, isHidden: $testBool)
        
    }
}


