//
//  WeaponBackCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponBackCard: View {
    @Binding var weapon:Weapon
    var gridLabelSize: CGFloat? = 200
    var gridValueSize: CGFloat? = 100
    
    var valorantFont: String = VFonts.Valorant.rawValue

    var body: some View {
        ZStack{
    
            Rectangle()
                .colorMultiply(.gray.opacity(0.7))
                .frame(maxWidth: .infinity, maxHeight: 500)
                .cornerRadius(20)
                .shadow(color:.black.opacity(0.5), radius:10, x:10, y:10)
            
            VStack{
                HStack{
                    // weapon.killStreamIcon
                    AsyncImage(url: URL(string: weapon.killStreamIcon ?? "")){ image in
                        image.resizable().scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 100)

                            .padding(.top, 70)


                    } placeholder: {
                        Image(systemName: "questionmark.app")
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 100)
                            .padding(70)
                            .foregroundColor(.white)


                    }
                }
                Spacer()
            }
            
            VStack{
                
                Text(LocalizedStringKey("weapon_stats"))
                    .font(.custom(valorantFont, size: 35))
                        .bold()
                        .foregroundColor(.pink)
                        .padding()
                
                Grid{
                    ExtractedView(title: "fire_rate", value: weapon.weaponStats?.fireRate?.description ?? "", width: .infinity)
                    Divider()
                
                    ExtractedView(title: "magazin_size", value: weapon.weaponStats?.fireRate?.description ?? "", width: .infinity)
                    Divider()

                    ExtractedView(title: "equip_time", value: weapon.weaponStats?.fireRate?.description ?? "", width: .infinity)
                    Divider()

                    ExtractedView(title: "reload_time", value: weapon.weaponStats?.fireRate?.description ?? "", width: .infinity)
                    Divider()
                    
                    
                    
                }
                .font(.custom(valorantFont, size: 15))
                .foregroundColor(.white)
             
                
            }
            .padding(.top, 100)
            .frame(maxWidth: .infinity, maxHeight: 500)

        }
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: 500)
        .cornerRadius(20)
    }
}

struct WeaponBackCard_Previews: PreviewProvider {
    
    @State static var weapon:Weapon = Dummy.dummyWeapon
   

    static var previews: some View {
        
        WeaponBackCard(weapon: $weapon)
    }
}

struct ExtractedView: View {
    let title:String
    let value: String
    let width: CGFloat
    
    var body: some View {
        GridRow {
            HStack{
                Text(LocalizedStringKey(title))
                Text(": ")
            }
            .frame(maxWidth: width, alignment: .trailing)
            
            HStack{
                Text(value)
            }
            .frame(maxWidth: width, alignment: .leading)
            
        }
    }
}
