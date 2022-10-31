//
//  RLMPokemonDetailed.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 27.10.22.
//

import RealmSwift
import Alamofire

@objcMembers
class RLMPokemonDetailed: Object {
    dynamic var  id = Int()
    dynamic var  weight = Int()
    dynamic var  height = Int()
    
    init(with object: PokemonDetailed) {
        self.id = object.id

    }
    //TODO: implement the remaining models
}

