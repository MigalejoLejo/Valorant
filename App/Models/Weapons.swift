//
//  Weapons.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import Foundation

struct WeaponsData: Codable {
    var data: [Weapon]
}

struct Weapon: Codable {
    var uuid: String
    var displayName: String
    var category: String?
    var displayIcon: String?
    var defaultSkinUuid: String?
    var killStreamIcon: String?
    var weaponStats: WeaponStats?
    var shopData: Shop?
    var skins: [Skin]?
}

struct WeaponStats: Codable {
    var fireRate: Double?
    var magazineSize: Double?
    var equipTimeSeconds: Double?
    var reloadTimeSeconds: Double?
}

struct Skin: Codable{
    var uuid: String
    var displayName: String?
    var displayIcon: String?
}

struct Shop: Codable {
    var cost: Int?
    var category: String?
}
