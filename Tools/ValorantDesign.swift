//
//  ValorantDesign.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 28/5/23.
//

import SwiftUI


enum VFonts: String {
    case Russo = "RussoOne-Regular"
    case Valorant = "VALORANT-Regular"
}

struct VDesign {
    
    static let Russo:String = "RussoOne-Regular"
    static let Valorant:String = "Valorant-Font"


    public static func printSystemFonts() {
        // Use this identifier to filter out the system fonts in the logs.
        let identifier: String = "[SYSTEM FONTS]"
        // Here's the functionality that prints all the system fonts.
        for family in UIFont.familyNames as [String] {
            debugPrint("\(identifier) FONT FAMILY :  \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                debugPrint("\(identifier) FONT NAME :  \(name)")
            }
        }
    }
   
}
