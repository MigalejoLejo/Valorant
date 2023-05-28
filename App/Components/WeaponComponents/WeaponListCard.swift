//
//  WeaponListCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponListCard: View {
    @Binding var weapon:Weapon
    @Binding var cardColor: Color

    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(cardColor)
                        .frame(width: 350, height: 40)
                    
                    Text(weapon.displayName)
                        .foregroundColor(.white)
                        .font(.custom(ValorantDesign.mainFont, size: 30))
                        .cornerRadius(5)
                        .bold()
                }
            }
            .background(
                ZStack{
                    AsyncImage(url: URL(string: weapon.displayIcon ?? ""), scale: 2){image in
                        image
                            .scaledToFit()
                            .shadow(radius: 1, x:10, y:10)
                    } placeholder: {}
                    
                }
                    .frame(width: 350, height: 150)
                    .background(cardColor.opacity(0.2))
            )
            .frame(width: 350, height: 150)
            
        }
        .frame(width: 350, height: 150)
        .cornerRadius(20)
        
    }
    
}


struct WeaponListCard_Previews: PreviewProvider {
    @State static var weapon:Weapon = Dummy.dummyWeapon
    @State static var cardColor: Color = Color.random()

    
    static var previews: some View {
        WeaponListCard(weapon:$weapon, cardColor: $cardColor)
    }
}
