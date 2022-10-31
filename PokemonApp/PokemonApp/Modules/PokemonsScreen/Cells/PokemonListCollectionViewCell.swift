//
//  PokemonListCollectionViewCell.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 24.10.22.
//

import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

extension PokemonListCollectionViewCell: Configurable {
    func configure(with presentetionObject: Any) {
        guard let po = presentetionObject as? Pokemon else { return }
        pokemonNameLabel.text = po.name
    }
}
