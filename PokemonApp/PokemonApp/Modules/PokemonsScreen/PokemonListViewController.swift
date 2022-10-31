//
//  PokemonListViewController.swift
//  PokemonApp
//
//  Created by Kirill Kubarskiy on 23.10.22.
//

import UIKit
import Alamofire
import RealmSwift

final class PokemonListViewController: UIViewController {
    
    var viewModel: PokemonListViewModel = PokemonListViewModel()
    let pokemonListCollectionViewCellID = "PokemonListCollectionViewCell"

    @IBOutlet weak var pokemonListCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureXib()
        loadData()
    }
    
    private func configureXib() {
        let nibCell = UINib(nibName: pokemonListCollectionViewCellID, bundle: nil)
        pokemonListCollectionView.register(nibCell, forCellWithReuseIdentifier: pokemonListCollectionViewCellID)
    }
    
    private func loadData() {
        viewModel.getPokemonList { [weak self] result in
            if result {
                DispatchQueue.main.async {
                    self?.pokemonListCollectionView.reloadData()
                }
            } else {
                
            }
        }
    }
}

extension PokemonListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: pokemonListCollectionViewCellID, for: indexPath) as! PokemonListCollectionViewCell
      
        let pokemon = viewModel.pokemons[indexPath.row]
        
        cell.configure(with: pokemon)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 44)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokemonListCollectionView.deselectItem(at: indexPath, animated: false)
        
        let  object = viewModel.pokemons[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let index = object.getId(),
            let vc = storyboard.instantiateViewController(withIdentifier: "PokemonDetailedViewController") as? PokemonDetailedViewController else {
            return
        }
        
        vc.title = "\(viewModel.pokemons[indexPath.row].name.uppercased())"
        vc.viewModel.index = index
        navigationController?.pushViewController(vc, animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pos = scrollView.contentOffset.y
        if pos > pokemonListCollectionView.contentSize.height-50 - scrollView.frame.size.height{
            viewModel.getPokemonList(isPagination: true) { [weak self] result in
                self?.pokemonListCollectionView.reloadData()
            }
        }
    }
}

