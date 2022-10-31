//
//  DBManager+DBPokemonListProtocol.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 28.10.22.
//

import Foundation

protocol DBPokemonListProtocol {
    func save(pokemons: [Pokemon], limit: Int, offset: Int)
    func getPokemonList(offset: Int, completion: @escaping ([Pokemon]) -> Void)
    func removeAllPokemonList()
}


extension DBManager: DBPokemonListProtocol {
    func save(pokemons: [Pokemon], limit: Int, offset: Int) {
        
    }
    
    func getPokemonList(offset: Int, completion: @escaping ([Pokemon]) -> Void) {
        
    }
    
    func removeAllPokemonList() {
        
    }
    
    
   private func save(pokemon: RLMPokemonList) {
        
    }
    
   private func getAllPokemons(completion: @escaping ([RLMPokemonList]) -> ()) {
        getObjects(RLMPokemonList.self) { (pokemons) in
            completion(pokemons)
        }
    }
}
