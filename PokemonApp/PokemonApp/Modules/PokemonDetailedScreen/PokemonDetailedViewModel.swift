//
//  PokemonDetailedViewModel.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

final class PokemonDetailedViewModel {
    
    var networkManager: NetworkManagerProtocol = NetworkManager()
    var index: String = ""
    private (set) var pokemon: PokemonDetailed?
    
    func getPokemon(completion: @escaping (Bool) -> Void) {
        networkManager.getPokemonDetailed(with: index) { [weak self] pokemon, error in
            guard let self = self,
                  let pokemon = pokemon else {
                      completion(false)
                      return
                  }
            self.pokemon = pokemon
            completion(true)
        }
    }
}
