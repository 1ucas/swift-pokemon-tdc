//
//  PokemonTCGViewController.swift
//  Swift TCG Module
//
//  Created by Lucas Ramos Maciel on 22/08/21.
//

import UIKit

public class PokemonTCGViewController: UIViewController {

    private var searchTask: DispatchWorkItem?

    private lazy var pokemonTcgView: PokemonTCGView = {
        let model = PokemonTCGView.PokemonTCGViewData()
        let view = PokemonTCGView(model: model)
        return view
    }()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let viewModel = PokemonTCGViewModel()
    
    override public func loadView() {
        view = pokemonTcgView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "TCG"

        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        viewModel.delegate = self
        viewModel.fetch()
    }
}

extension PokemonTCGViewController: UISearchResultsUpdating {
        
    public func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel.fetch(name: searchBar.text!)
    }
}

extension PokemonTCGViewController: PokemonTCGViewModelStateListener {
    func didChangeState(state: PokemonTCGViewModel.State) {
        switch state {
        case .loading:
            pokemonTcgView.model.isLoading = true
        case .idle(let cards):
            pokemonTcgView.model.isLoading = false
            pokemonTcgView.model.allCards = cards
        }
    }
}
