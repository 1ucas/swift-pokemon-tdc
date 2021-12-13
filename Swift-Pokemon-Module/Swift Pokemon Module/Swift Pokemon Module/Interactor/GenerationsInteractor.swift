//
//  GenerationsUseCase.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import Foundation

enum BusinessError: Error {
    case failed
    case conversion
}

class GenerationsInteractor {
    
    private let apiService: PokemonApiService
    
    init(apiService: PokemonApiService) {
        self.apiService = apiService
    }
    
    func loadFirstPokemon() async throws -> PokemonEntity {
        return try await loadPokemon(name: "charmander")
    }
    
    func loadNextPokemon() async throws -> PokemonEntity {
        return try await loadPokemon(name: "blastoise")
    }
    
    private func loadPokemon(name: String) async throws -> PokemonEntity {
        do {
            let pokemon = try await apiService.fetchPokemon(name: name)
            return try convertToEntity(pokemon: pokemon)
        } catch {
            print(error)
            throw BusinessError.failed
        }
    }
    
    private func convertToEntity(pokemon: PokemonDTO) throws -> PokemonEntity {
        let url = URL(string: pokemon.sprites.front_default)
        guard let url = url else { throw BusinessError.conversion }
        return PokemonEntity(name: pokemon.name, order: pokemon.order, imageURL: url)
    }
    
}
