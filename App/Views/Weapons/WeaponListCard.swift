//
//  WeaponListCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponListCard: View {
    @Binding var weapon:Weapon
    @State var cardColor: Color = .pink
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var valorantFont: String = VFonts.Valorant.rawValue
    
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
                        .font(.custom(valorantFont, size: 30))
                        .cornerRadius(5)
                        .bold()
                }
            }
            .background(
                ZStack{
                    HStack{
                        Spacer()
                        AsyncImage(url: URL(string: weapon.killStreamIcon ?? "")){image in
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(1...40, id: \.self) { item in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .rotationEffect(.degrees(15))
                                        .padding(-5)
                                }
                            }
                        } placeholder: {}
                    }
                        
                    AsyncImage(url: URL(string: weapon.displayIcon ?? ""), scale: 2){image in
                        image
                            .scaledToFit()
                            .shadow(radius: 1, x:10, y:10)
                            .rotationEffect(.degrees(weapon.displayName == "Melee" ? 20 : 0))
                            .padding(.top, weapon.displayName == "Melee" ? -40 : -20 )

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
    
    static var previews: some View {
        WeaponListCard(weapon:$weapon)
    }
}
