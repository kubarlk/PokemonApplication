//
//  PokemonDetailedViewController.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import UIKit
import Kingfisher

final class PokemonDetailedViewController: UIViewController {
    
    var viewModel: PokemonDetailedViewModel = PokemonDetailedViewModel()
    private var downloadTask: DownloadTask?
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    private func loadData() {
        viewModel.getPokemon { [weak self] result in
            if result {
                let pokemon = self?.viewModel.pokemon
                if let weight = pokemon?.weight, let height = pokemon?.height, let imageURL = pokemon?.sprites?.front_default, let type = pokemon?.types?.first?.type.name {
                    self?.weightLabel.text = "Weight: \(weight) kg"
                    self?.heightLabel.text = "Height: \(height) cm" //cm ??
                    self?.typeLabel.text = "Type: \(type)"
                    
                    let urlImage = URL(string: imageURL)
                        if let data = try? Data(contentsOf: urlImage!)
                        {
                            self?.pokemonImageView.image = UIImage(data: data)
                            self?.pokemonImageView.kf.setImage(with: URL(string: imageURL), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
                            self?.pokemonImageView.kf.indicatorType = .activity
                        }
                }
            } else {
                
            }
        }
    }
}





