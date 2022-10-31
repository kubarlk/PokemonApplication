//
//  PokemonListViewModel.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

enum Constants {
    static let limit: Int = 20
}

final class PokemonListViewModel {

    var networkManager: NetworkManagerProtocol = NetworkManager()

    private (set) var pokemons = [Pokemon]()
    private var offset: Int = 0

    func getPokemonList(isPagination: Bool = false, completion: @escaping (Bool) -> Void) {
        var _offset = 0
        if isPagination {
            offset += 1
            _offset = offset
        }
        
        networkManager.getPokemonList(limit: Constants.limit, offset: _offset) { [weak self] pokemons, error in
            guard let self = self,
                  let pokemons = pokemons else {
                      completion(false)
                      return
                  }
            self.pokemons = pokemons
            
            if isPagination {
                self.pokemons.append(contentsOf: pokemons)
            } else {
                self.pokemons = pokemons
            }
            completion(true)
        }
    }
}
