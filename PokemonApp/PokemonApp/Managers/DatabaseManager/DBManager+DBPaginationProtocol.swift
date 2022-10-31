//
//  DBManager+DBPaginationProtocol.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 28.10.22.
//

import Foundation

protocol DBPaginationProtocol {
    func savePagination(limit: Int, offset: Int)
    func getLimit() -> Int
    func getOffset() -> Int
}


extension DBManager: DBPaginationProtocol {
    func savePagination(limit: Int, offset: Int) {
        
    }
    
    func getLimit() -> Int {
        0
    }
    
    func getOffset() -> Int {
        0
    }
}
