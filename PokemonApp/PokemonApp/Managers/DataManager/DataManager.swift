//
//  DataManager.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 28.10.22.
//

import Foundation

protocol DataManagerProtocol {
    func getPokemonList(limit: Int, offset: Int, completion: @escaping ([Pokemon]?, Error?) -> Void)
    func getPokemonDetailed(with id: String, completion: @escaping (PokemonDetailed?, Error?) -> Void)
}

final class DataManager: DataManagerProtocol {
    
    let networkManager: NetworkManagerProtocol = NetworkManager()
    let databaseManager: DBManager = DBManager()
    
    func getPokemonList(limit: Int, offset: Int, completion: @escaping ([Pokemon]?, Error?) -> Void) {
        //TODO: this is first step will be updated during offline implementation
        networkManager.getPokemonList(limit: limit, offset: offset, completion: completion)
    }
    
    func getPokemonDetailed(with id: String, completion: @escaping (PokemonDetailed?, Error?) -> Void) {
        //TODO: this is first step will be updated during offline implementation
        networkManager.getPokemonDetailed(with: id, completion: completion)
    }
}
