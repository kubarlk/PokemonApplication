//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation
import Moya
import Alamofire

class DefaultAlamofireManager: Alamofire.Session {
    static let shared: DefaultAlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60

        return DefaultAlamofireManager(configuration: configuration)
    }()
}

final class NetworkManager: NetworkManagerProtocol {
    
    var provider = MoyaProvider<MoyaPokemonAPI>(session: DefaultAlamofireManager.shared)
    
    func getPokemonList(limit: Int, offset: Int, completion: @escaping ([Pokemon]?, Error?) -> Void) {
        provider.request(.PokemonList(limit: limit, offset: offset)) { (result) in
            switch result {
            case let .success(response):
#if DEBUG
                let json = try? JSONSerialization.jsonObject(with: response.data, options: [])
#endif
                do {
                    let pokemonList = try response.map(PokemonListResponse.self)
                    completion(pokemonList.results, nil)
                } catch let error {
                    completion(nil, error)
                }
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    func getPokemonDetailed(with id: String, completion: @escaping (PokemonDetailed?, Error?) -> Void) {
        provider.request(.Pokemon(id: id)) { (result) in
            switch result {
            case let .success(response):
#if DEBUG
                let json = try? JSONSerialization.jsonObject(with: response.data, options: [])
#endif
                do {
                    let pokemon = try response.map(PokemonDetailed.self)
                    completion(pokemon, nil)
                } catch let error {
                    completion(nil, error)
                }
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
}
