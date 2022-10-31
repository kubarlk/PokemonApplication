//
//  PokemonListResponse.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

struct PokemonListResponse: Codable {
    var results: [Pokemon]?
    var count: Int
    var previous: String?
    var next: String?
}
