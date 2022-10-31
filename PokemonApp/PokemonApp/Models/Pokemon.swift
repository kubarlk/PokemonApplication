//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

struct Pokemon: Codable {
    
    var name: String
    var urlString: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case urlString = "url"
    }
    
}

extension Pokemon {
    func getId() -> String? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        return url.lastPathComponent
    }
    
    func getImageURL() -> URL? {
        return URL(string: urlString)
    }

    
}
