//
//  WeaponBackCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponBackCard: View {
    @Binding var weapon:Weapon
    

    var body: some View {
        ZStack{
            Rectangle()
                .colorMultiply(.gray.opacity(0.7))
                .frame(width: 350, height: 500)
                .cornerRadius(20)
                .shadow(color:.black.opacity(0.5), radius:10, x:10, y:10)
            VStack{
                WeaponDescription(weapon: $weapon)
                    .frame(width: 350, height: 200)
            }
            .frame(width: 350, height: 500)
            .cornerRadius(20)
        }
    }
}

struct WeaponBackCard_Previews: PreviewProvider {
    
    @State static var weapon:Weapon = Dummy.dummyWeapon

    static var previews: some View {
        WeaponBackCard(weapon: $weapon)
    }
}
