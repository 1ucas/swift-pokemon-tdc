//
//  PokemonTCGViewModel.swift
//  Swift TCG Module
//
//  Created by Lucas Ramos Maciel on 26/08/21.
//

import Foundation

protocol PokemonTCGViewModelStateListener : AnyObject {
    func didChangeState(state: PokemonTCGViewModel.State)
}

class PokemonTCGViewModel {
    
    private var isLoading = false

    enum State {
        case loading
        case idle(data: [PokemonCard])
    }
    
    var delegate: PokemonTCGViewModelStateListener?

    private let service: PokemonTCGService = PokemonTCGService()

    func fetch(name: String = "charmander") {
        if name.count > 4 && !isLoading {
            isLoading = true
            self.delegate?.didChangeState(state: .loading)
            service.fetchCards(name: name) { pokemons in
                self.isLoading = false
                self.delegate?.didChangeState(state: .idle(data: pokemons))
            }
        }
    }
}
