//
//  RLMPokemonList.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 27.10.22.
//

import RealmSwift

@objcMembers
class RLMPokemonList: Object {
    dynamic var id: Int
    dynamic var name = String()
    dynamic var urlString = String()
    
    init(from object: Pokemon, index: Int) {
        self.id = index
        self.name = object.name
        self.urlString = object.urlString
    }
}

