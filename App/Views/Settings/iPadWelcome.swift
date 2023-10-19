//
//  iPadWelcome.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 9/6/23.
//

import SwiftUI

struct iPadWelcome_Agents: View {
    var body: some View {
        ZStack{
            VStack{
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 100)
                Image("group_of_agents")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
    }
}


struct iPadWelcome_Weapons: View {
    var body: some View {
        ZStack{
            VStack{
                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 100)
                
                Image("knife")
                    .resizable()
                    .scaledToFit()
                    .padding(-10)
                    .padding(.top, 35)
            }
        }
    }
}



struct iPadWelcome_Agents_Previews: PreviewProvider {
    static var previews: some View {
        iPadWelcome_Agents()
    }
}


struct iPadWelcome_Weapons_Previews: PreviewProvider {
    static var previews: some View {
        iPadWelcome_Weapons()
    }
}
