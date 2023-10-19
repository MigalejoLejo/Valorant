//
//  WeaponCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponImage: View {
    
    @Binding var displayIcon:String
    
    var body: some View {
        AsyncImage(url: URL(string: displayIcon)){ image in
            image.resizable().scaledToFit()

        } placeholder: {
            Image(systemName: "questionmark.app")
                .resizable()
                .scaledToFit()
                .padding(250)
                
        }
        .frame(maxWidth: .infinity)

    }
}

struct WeaponImage_Previews: PreviewProvider {
    @State static var weapon:String = (Dummy.dummyWeapon.displayIcon ?? "")
    static var previews: some View {
        WeaponImage(displayIcon: $weapon)
    }
}
