//
//  PokemonDetailed.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

struct PokemonDetailed: Codable {
    var id: Int
    var sprites: PokemonSprites?
    var weight: Int
    var height: Int
    var types: [PokemonTypes]?
}

struct PokemonSprites: Codable {
    var front_default: String?
    var front_female: String?
}

struct PokemonTypes: Codable {
    var slot: Int
    var type: PokemonType
}

struct PokemonType: Codable {
    var name: String
    var url: String
}
