//
//  WeaponStats.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct WeaponDescription: View {
    @Binding var weapon:Weapon

    
    var body: some View {
        VStack{
            Text("Weapon Stats")
                    .font(.title)
                    .bold()
                    .foregroundColor(.pink)
            VStack{
                HStack{
                    Text("Fire Rate: ")
                    Text(weapon.weaponStats?.fireRate?.description ?? "")
                }
                HStack{
                    Text("Magazine Size: ")
                    Text(weapon.weaponStats?.magazineSize?.description ?? "")
                }
                
                
                HStack{
                    Text("Equip Time (Secs): ")
                    Text(weapon.weaponStats?.equipTimeSeconds?.description ?? "")
                }
                HStack{
                    Text("Reload Time (Secs): ")
                    Text(weapon.weaponStats?.reloadTimeSeconds?.description ?? "")
                }
            }
            .font(.title2)

            .padding(.top,1)
            .foregroundColor(.white)
            
        }
    }
}

struct WeaponDescription_Previews: PreviewProvider {
    @State static var weapon = Dummy.dummyWeapon

    static var previews: some View {
        WeaponDescription(weapon:$weapon)
    }
}
