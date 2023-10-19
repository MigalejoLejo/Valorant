//
//  WeaponFrontCard.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponFrontCard: View {
    @Binding var weapon:Weapon
    @Binding var displayIcon:String
    @Binding var skinName:String
    @Binding var cardColor: Color
    
    var valorantFont: String = VFonts.Valorant.rawValue

    
    
    var body: some View {
        ZStack{
            
            // Background
            Rectangle()
                .fill(.white)
                .cornerRadius(20)
                      
            // Header
            VStack{
                  HStack{
                    Text(weapon.shopData?.category ?? "")
                        .font(.custom(valorantFont, size: 25))
                        .foregroundColor(.black.opacity(0.7))
                        .frame(width: 250, alignment: .leading)

                    Spacer()
                    
                    AsyncImage(url: URL(string: weapon.killStreamIcon ?? "")){ image in
                        image.resizable().scaledToFit()
                            .frame(maxWidth: 200)

                        

                    } placeholder: {
                        Image(systemName: "questionmark.app")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .scaledToFit()
                            .foregroundColor(.gray)
                    }
                    .colorMultiply(.gray)
                }
                  .frame(maxWidth: .infinity, maxHeight: 100)

                Text(weapon.displayName)
                    .font(.custom(valorantFont, size: 40))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, -45)

                Spacer()

            }
            
            // Weapon Background
            VStack{
                HStack{
                    HStack{}
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(cardColor).opacity(0.1)
                }
            }
            .padding(.top, -50)
            
            // Weapon Main Image
            VStack{
                HStack{
                    AsyncImage(url: URL(string: displayIcon)){ image in
                        image.resizable().scaledToFit()
                            .rotationEffect(.degrees(15))
                            .shadow(color:.black.opacity(0.7), radius: 3, x:10, y:10)
                            .frame(maxWidth: .infinity, maxHeight: 130)




                    } placeholder: {
                        Image(systemName: "questionmark.app")
                            .resizable()
                            .scaledToFit()
                            .padding(190)
                    }
                }
            }
            .padding(.top, -50)
            
          
        
            
            // Skins
            VStack{
                HStack{
                    Text(skinName.isEmpty ? "" : LocalizedStringKey("selected_skin"))
                        .font(.custom(valorantFont, size: 15))
                        .foregroundColor(.black.opacity(0.7))
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
                    .padding(.top, 250)
                HStack{
                    Text(skinName.isEmpty ? skinName : skinName)
                         .font(.custom(valorantFont, size: 17))
                         .bold()
                         .textCase(.uppercase)
                         .foregroundColor(.white)
                         .padding(.horizontal)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(skinName.isEmpty ? .clear : cardColor)


                
            }
         
            // Footer
            VStack{
                Spacer()
                HStack{
                    Text("Tap to show stats")
                        .font(.custom(valorantFont, size: 13))
                        .foregroundColor(.gray)

                    Spacer()
                    if ((weapon.shopData?.cost) != nil) {
                        HStack{
                            Text("$")
                                .foregroundColor(.green)
                            Text((weapon.shopData?.cost?.description ?? ""))
                        }
                       
                            .font(.custom(valorantFont, size: 45))
                    } else {
                        Text(LocalizedStringKey("no_price_available"))
                            .font(.custom(valorantFont, size: 15))
                    }
                }
            }
            .padding(.vertical)
            .onAppear{
                if displayIcon == "" {
                    displayIcon = weapon.displayIcon ?? ""
                }
            }
                

            
        }
        .padding(.top, 10)
        .frame(maxWidth: .infinity, maxHeight: 1000)
    }
}

struct WeaponFrontCard_Previews: PreviewProvider {
    @State static var weapon:Weapon = Dummy.dummyWeapon
    @State static var displayIcon:String = Dummy.dummyWeapon.displayIcon ?? ""
    @State static var skinName:String = Dummy.dummyWeapon.skins?[0].displayName ?? ""
    @State static var cardColor: Color = Color.random()
    
    static var previews: some View {
        WeaponFrontCard(weapon: $weapon, displayIcon: $displayIcon, skinName: $skinName, cardColor: $cardColor)
    }
}


//
