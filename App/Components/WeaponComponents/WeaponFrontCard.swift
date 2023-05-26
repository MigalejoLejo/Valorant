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
    
    
    var body: some View {
        
        ZStack{
            //            Rectangle()
            //                .fill(.white)
            //                .frame(width: 350, height: 500)
            //                .cornerRadius(20)
            //                .shadow(color:.black.opacity(0.5), radius:10, x:10, y:10)
            Rectangle()
                .fill(.white)
                .cornerRadius(20)
            
            VStack{
                HStack{
                    HStack{}
                        .frame(width: 350, height: 100)
                        .background(.pink)

                    
                }
            }
            
            VStack{
                HStack{
                  
                        WeaponNameDisplay(weapon: $weapon)
                            .padding(30)
                        Spacer()
                    
                   
                }
               

                Spacer()
                
            }
            
            VStack{
                HStack{
                    WeaponImage(displayIcon: $displayIcon)
                    
                        .rotationEffect(.degrees(15))
                        .shadow(color:.black.opacity(0.7), radius: 10, x:10, y:10)
                }
            }
                
                // FIXME: it shows error but then disappears
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        if ((weapon.shopData?.cost) != nil) {
                            Text("$ "+(weapon.shopData?.cost?.description ?? ""))
                        } else {
                            Text("no price available")
                        }
                    }
                }
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .foregroundColor(.green)
                .colorMultiply(.gray)
                .padding()
                .onAppear{
                    displayIcon = weapon.displayIcon ?? ""
                }
            
            
           
                VStack{
                    HStack{}
                        .padding(.top, 300)
                    HStack{
                        Text(skinName.isEmpty ? skinName : "test")
                             .frame(width: 350, height: 50)
                             .font(.title2)
                             .bold()
                             .textCase(.uppercase)
                             .foregroundColor(.purple)
                        

                        
                    }
                    
                }
                

            
        }
        .frame(width: 350, height: 500)
        .shadow(radius: 10)
        
    }
}

struct WeaponFrontCard_Previews: PreviewProvider {
    @State static var weapon:Weapon = Dummy.dummyWeapon
    @State static var displayIcon:String = Dummy.dummyWeapon.displayIcon ?? ""
    @State static var skinName:String = Dummy.dummyWeapon.skins?[0].displayName ?? ""
    
    static var previews: some View {
        WeaponFrontCard(weapon: $weapon, displayIcon: $displayIcon, skinName: $skinName)
    }
}
