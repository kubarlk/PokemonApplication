//
//  RLMPaginationInformation.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 28.10.22.
//

import Foundation
import RealmSwift

@objcMembers
class RLMPaginationInformation: Object {
    dynamic var offset = Int()
    dynamic var limit = Int()
}
