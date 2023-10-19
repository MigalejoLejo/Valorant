//
//  AgentsService.swift
//  Valorant
//
//  Created by Miguel Alejandro Correa Avila on 24/5/23.
//

import Foundation


class AgentsService: ObservableObject {
    
    @Published var favoriteAgents = Set <String>()
    
    init(){
        let initAgents: Set<String> = Set (UserDefaults.standard.array(forKey: "Agents") as? [String] ?? [])
        favoriteAgents = initAgents
    }

    
    func getAgents(completion: @escaping (Result<AgentsData, Error>) -> Void) {
        let userLanguage = Locale.current.language.languageCode?.identifier ?? "en"
        var urlLang: String
        
        switch userLanguage {
        case "en":urlLang = "en-US"
        case "es":urlLang = "es-ES"
        case "de":urlLang = "de-DE"
        default: urlLang = "en-US"
        }
        
        let requestURL = "https://valorant-api.com/v1/agents?language="+urlLang
        
        guard let url = URL (string: requestURL) else {
            return
        }

        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                completion(.failure(error))
            }
        
            if let data = data {
                do {
                    let agents = try JSONDecoder().decode(AgentsData.self, from: data)
                    completion(.success(agents))
                } catch {
                    completion(.failure(error))
                }
            }

        }.resume()
    }
    
    
     func addFavoriteAgent(by id: String){
        favoriteAgents.insert(id)
         UserDefaults.standard.set(Array(favoriteAgents), forKey: "Agents")
    }
    
    func removeFavoriteAgent(by id: String){
        favoriteAgents.remove(id)
        UserDefaults.standard.set(Array(favoriteAgents), forKey: "Agents")
    }
    
    func isFavoriteAgent(id: String) -> Bool{
        if favoriteAgents.contains(id){
            return true
        }else {
            return false
        }
    }
    
}
