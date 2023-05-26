//
//  WeaponListCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponListCard: View {
    @Binding var weapon:Weapon
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(.green.opacity(0.9))
                        .colorMultiply(.gray)
                        .frame(width: 350, height: 40)
                    
                    Text(weapon.displayName)
                        .foregroundColor(.white)
                        .font(.title)
                        .cornerRadius(5)
                        .bold()
                }
            }
            .background(
                ZStack{
                    AsyncImage(url: URL(string: weapon.displayIcon ?? ""), scale: 2){image in
                        image.scaledToFit()} placeholder: {}
                }
                    .frame(width: 350, height: 150)
                    .background(.white.opacity(0.8))
            )
            .frame(width: 350, height: 150)
            .shadow(color: .black.opacity(0.7), radius: 20, x:10, y:10)
            
        }
        .frame(width: 350, height: 150)
        .cornerRadius(20)
        
    }
    
}


struct WeaponListCard_Previews: PreviewProvider {
    @State static var weapon:Weapon = Dummy.dummyWeapon
    
    static var previews: some View {
        WeaponListCard(weapon:$weapon)
    }
}
