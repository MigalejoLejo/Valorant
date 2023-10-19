//
//  WeaponsService.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import Foundation


class WeaponsService {
    
    func getWeapons(completion: @escaping (Result<WeaponsData, Error>) -> Void) {
        let userLanguage = Locale.current.language.languageCode?.identifier ?? "en"
        var urlLang: String
        
        switch userLanguage {
        case "en":urlLang = "en-US"
        case "es":urlLang = "es-ES"
        case "de":urlLang = "de-DE"
        default: urlLang = "en-US"
        }
        
        let requestURL = "https://valorant-api.com/v1/weapons?language="+urlLang
        
        guard let url = URL (string: requestURL) else {
            return
        }
        
        
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                completion(.failure(error))
            }
        
            if let data = data {
                do {
                    let weapons = try JSONDecoder().decode(WeaponsData.self, from: data)
                    completion(.success(weapons))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
