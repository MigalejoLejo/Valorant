//
//  Languages.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import Foundation

enum Language: String, CaseIterable{
    case Spanish = "es-ES"
    case English = ""
}

struct DictionaryEntry{
    var urlLang : String
    var Agents : String
    var Weapons : String
    var Settings : String
    var Description : String
    var Flag : String
}


struct ValorantTranslation {
    static var Spanish = DictionaryEntry(
            urlLang: "es-ES",
            Agents: "Agentes",
            Weapons: "Armas",
            Settings: "Configuración",
            Description: "Descripción",
            Flag: "🇪🇸")
    
    static var English = DictionaryEntry (
            urlLang: "",
            Agents: "Agents",
            Weapons: "Weapons",
            Settings: "Configuration",
            Description: "Description",
            Flag: "🇬🇧"
        )
    
}

struct LangTools{
    static func get(language:Language) -> DictionaryEntry {
        var result: DictionaryEntry
        
        
        switch language {
        case .English: result = ValorantTranslation.English
        case .Spanish: result = ValorantTranslation.Spanish
        }
        
        return result
    }
}


