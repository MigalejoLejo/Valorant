//,
//  Dummies.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 25/5/23.
//

import SwiftUI

struct Dummy {
    
    static var dummyAgent:Agent = Agent(
        uuid: "some id",
        displayName: "some name",
        description: "Gekko, de Los Ángeles, lidera una pequeña pandilla de calamitosas criaturas. Sus colegas toman la delantera para dispersar a los enemigos, mientras que Gekko los persigue para luego reagruparse y repetir el proceso.",
        displayIcon:"https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png",
        fullportrait: "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/fullportrait.png",
        displayIconSmall : "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/displayicon.png",
        killfeedPortrait : "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/killfeedportrait.png",
        background : "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png",
        backgroundGradientColors: [
                        "ff9c33ff",
                        "b04621ff",
                        "523a23ff",
                        "44412eff"
                    ]
        
    )
    
  static var dummyWeapon:Weapon = Weapon(
        uuid: "String",
        displayName: "String",
        category: "String",
        displayIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/displayicon.png",
        defaultSkinUuid: "String",
        killStreamIcon: "https://media.valorant-api.com/weapons/63e6c2b6-4a8e-869c-3d4c-e38355226584/killstreamicon.png",
        
        weaponStats: WeaponStats(
            fireRate: 12,
            magazineSize: 10,
            equipTimeSeconds: 9.0,
            reloadTimeSeconds: 2.0),
        shopData: Shop(cost: 3200, category: "Heavy Weapon"),
        skins: [
            Skin(
                uuid: "String",
                displayName: "dfg",
                displayIcon:  "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png"),
            Skin(
                uuid: "String",
                displayName: "dad<asefef",
                displayIcon:  "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png"),
            Skin(
                uuid: "String",
                displayName: "dadtjref",
                displayIcon:  "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png"),
            Skin(
                uuid: "String",
                displayName: "dadytjef",
                displayIcon:  "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png"),
            Skin(
                uuid: "String",
                displayName: "dae5ydef",
                displayIcon:  "https://media.valorant-api.com/weaponskins/89be9866-4807-6235-2a95-499cd23828df/displayicon.png")
        ]
        
    )
   
}
