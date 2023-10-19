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
    @State var cardColor: Color = Color.random()
    @State private var showingSkins = false
    
    @State var stantardWeaponIcon: String = ""
    
   
    
    let iPadDevice = UIDevice.current.localizedModel == "iPad"
    
    var valorantFont: String = VFonts.Valorant.rawValue
    
    
    @Binding var isHidden:Bool
    @State var isFlipped = false
    
    var body: some View {
        ScrollView{
            VStack{
                
                // Skins Button
                VStack{
                    HStack{
                        Spacer()
                        Button(LocalizedStringKey("show_skins")){
                            showingSkins.toggle()
                        }
                        .font(.custom(valorantFont, size: 15))
                        .sheet(isPresented: $showingSkins) {
                            SkinsView(weapon: $weapon, displayIcon: $displayIcon, stantardWeaponIcon: $stantardWeaponIcon, skinName: $skinName)
                        }
                    }
                    Spacer()
                }
                .padding()
                
                // Header
                VStack{
                    weaponName()
                    HStack{
                        Spacer()
                        Text(weapon.shopData?.category ?? "")
                            .font(Font.custom(VFonts.Valorant.rawValue, size: 30))
                            .foregroundColor(.pink)
                            .shadow(color: .black, radius: 2)
                    }
                }
               
                // Image
                ZStack{
                    WeaponImage(displayIcon: $displayIcon)
                        .onTapGesture {
                        }
                        .shadow(color: .pink, radius: 4)
                        .background{
                            weaponBackground()
                        }
                        
                        
                }
               
                // Weapon info
                VStack{
                    HStack{
                        Spacer()
                        Text("$")
                            .foregroundColor(.green)
                            .colorMultiply(.gray)
                        
                        Text(weapon.shopData?.cost?.description ?? "")
                            .foregroundColor(.black)
                            .shadow(color: .pink, radius: 2)


                    }
                    .font(Font.custom(VFonts.Valorant.rawValue, size: 30))
                    .padding(.bottom)

                    HStack{
                        Text (LocalizedStringKey("weapon_stats"))
                            .foregroundColor(.pink)
                            .shadow(color: .black, radius: 2)

                        Spacer()
                    }
                    .font(Font.custom(VFonts.Valorant.rawValue, size: 40))

                }

                
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
                .font(Font.custom(VFonts.Valorant.rawValue, size: 15))
                .foregroundColor(.black)
                .padding(.top)
            }
            .padding(.horizontal)
            .onAppear{
                if displayIcon == "" {
                    displayIcon = weapon.displayIcon ?? ""
                }
                stantardWeaponIcon = weapon.displayIcon ?? ""
            }
        }
        
    }
    
    
    @ViewBuilder
    func weaponBackground() -> some View{
        if iPadDevice {
            VStack{
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                
            }
            .rotationEffect(.degrees(-95))
            .font(Font.custom(VFonts.Valorant.rawValue, size: 120))
            .foregroundColor(.gray.opacity(0.2))
        } else {
            VStack{
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                Text(weapon.displayName)
                
            }
            .rotationEffect(.degrees(-95))
            .font(Font.custom(VFonts.Valorant.rawValue, size: 70))
            .foregroundColor(.gray.opacity(0.2))
        }
    }
    
    
    @ViewBuilder
    
    func weaponName() -> some View {
        VStack{
            HStack{
                Text(weapon.displayName)
                    .font(Font.custom(VFonts.Valorant.rawValue, size: iPadDevice ? 100 : 50))
                    .foregroundColor(.black)
                    .shadow(color: .pink, radius: 3)
                Spacer()
            }
            Spacer()
            
        }
    }
    
}


struct WeaponView_Previews: PreviewProvider {
    
    @State static var weapon:Weapon = Dummy.dummyWeapon
    
    static var previews: some View {
        @State var testBool:Bool = false
        WeaponView(weapon: $weapon, isHidden: $testBool)
            .previewDevice("iPad(10th generation)")
        
        WeaponView(weapon: $weapon, isHidden: $testBool)
            .previewDevice("iPhone 14 Pro")
    }
    
    
}

//
//ZStack{
//
//    ZStack{
//        if !isFlipped {
//            WeaponFrontCard(weapon: $weapon, displayIcon: $displayIcon, skinName: $skinName, cardColor: $cardColor)
//        } else {
//            WeaponBackCard(weapon: $weapon)
//                .rotation3DEffect(Angle(degrees:self.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//        }
//    }
//    .frame(maxWidth: .infinity, maxHeight: 450)
//    .rotation3DEffect(Angle(degrees:self.isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
//    .onTapGesture {
//        withAnimation(.spring()) {
//            isFlipped.toggle()
//        }
//    }
//    .onAppear{
//        isHidden = true
//    }
//
//
//    VStack{
//        HStack{
//            Spacer()
//            Button(LocalizedStringKey("show_skins")){
//                showingSkins.toggle()
//            }
//            .font(.custom(valorantFont, size: 15))
//
//            .sheet(isPresented: $showingSkins) {
//                SkinsView(weapon: $weapon, displayIcon: $displayIcon, skinName: $skinName)
//
//                   }
//        }
//        Spacer()
//
//    }
//    .padding()
//}
//.padding()
//
//
//}
