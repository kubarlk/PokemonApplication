//
//  MoyaPokemonAPI.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation
import Moya

enum MoyaPokemonAPI {
    case PokemonList(limit: Int, offset: Int)
    case Pokemon(id: String)
}

extension MoyaPokemonAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }

    var path: String {
        switch self {
        case .PokemonList:
            return "pokemon"
        case .Pokemon(let id):
            return "pokemon/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .PokemonList(let limit, let offset):
            let params = [
                "limit": limit,
                "offset": offset
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}

