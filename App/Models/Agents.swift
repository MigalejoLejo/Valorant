//
//  Agents.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import Foundation
import SwiftUI

struct AgentsData:Codable{
    var data:[Agent]
}

struct Agent:Codable{    
    var uuid: String
    var displayName: String
    var description: String
    var displayIcon: String?
    var fullportrait: String?
    var displayIconSmall : String?
    var killfeedPortrait : String?
    var background : String?
    var backgroundGradientColors: [String]?
    
    func getColor(at arrayIndex:Int) -> Color{
        var color = Color.blue
        if (arrayIndex < (backgroundGradientColors?.count ?? 0)){
            if arrayIndex >= 0{
                color = Color(hex: (backgroundGradientColors?[arrayIndex])!)
            } else {
                color = Color.green
            }
        }
        return color
    }
    
    
}


