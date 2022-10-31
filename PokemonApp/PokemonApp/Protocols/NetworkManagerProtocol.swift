//
//  NetworkManagerProtocol.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func getPokemonList(limit: Int, offset: Int, completion: @escaping([Pokemon]?, Error?) -> Void)
    func getPokemonDetailed(with id: String, completion: @escaping(PokemonDetailed?, Error?) -> Void)
}
