//
//  GenerationsViewModel.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import Foundation

enum GenerationsState {
    case loading
    case error
    case idle(PokemonViewModel)
}

class GenerationsPresenter: ObservableObject {
    
    private var interactor: GenerationsInteractor
    private weak var wireframe: GenerationsWireframeProtocol?
    
    @Published private(set) var state: GenerationsState = .loading

    init(interactor: GenerationsInteractor, wireframe: GenerationsWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    @MainActor
    func viewDidLoad() async {
        do {
            let pokemon = try await interactor.loadFirstPokemon()
            updatePokemon(pokemon: pokemon)
        } catch {
            state = GenerationsState.error
        }
    }
    
    @MainActor
    func loadNextPokemon() async {
        do {
            let pokemon = try await interactor.loadNextPokemon()
            updatePokemon(pokemon: pokemon)
        } catch {
            state = GenerationsState.error
        }
    }
    
    private func updatePokemon(pokemon: PokemonEntity) {
        let viewModel = convertToViewModel(pokemon: pokemon)
        state = GenerationsState.idle(viewModel)
    }
    
    private func convertToViewModel(pokemon: PokemonEntity) -> PokemonViewModel {
        return PokemonViewModel(title: "\(pokemon.name) - #\(pokemon.order)", imageUrl: pokemon.imageURL)
    }
}
