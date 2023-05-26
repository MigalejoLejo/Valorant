//
//  WeaponNameDisplay.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponNameDisplay: View {
    @Binding var weapon:Weapon
    
    var body: some View {
        VStack (alignment: .center){
            Text(weapon.shopData?.category ?? "")
//                .font(.system(size: 20, weight: .bold, design:))
                .font(.custom("RussoOne-Regular", size: 20))
                .foregroundColor(.green)
                .colorMultiply(.gray.opacity(0.8))
                .padding(.bottom, 0)
            Text(weapon.displayName)
                .font(.custom("RussoOne-Regular", size: 50))
                .font(.system(size: 50, weight: .bold, design: .default))
                .foregroundColor(.green)
                .colorMultiply(.gray)
        }
    }
}



struct WeaponNameDisplay_Previews: PreviewProvider {
    @State static var weapon:Weapon = Dummy.dummyWeapon

    static var previews: some View {
        WeaponNameDisplay(weapon: $weapon)
    }
}
