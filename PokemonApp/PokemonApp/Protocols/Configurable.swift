//
//  Configurable.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import Foundation

protocol Configurable: AnyObject {
    func configure(with presentetionObject: Any)
}
