//
//  PokemonDTO.swift
//  SwiftPokemonModule
//
//  Created by Lucas Ramos Maciel on 12/12/21.
//

import Foundation

struct PokemonDTO: Codable {
    let name: String
    let order: Int
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_default: String
}
