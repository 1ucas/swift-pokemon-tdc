//
//  PokemonTCGService.swift
//  Swift TCG Module
//
//  Created by Lucas Ramos Maciel on 22/08/21.
//

import UIKit

class PokemonTCGService {
    
    private struct PokemonCardDataDTO: Decodable {
        let data: [PokemonCardDTO]
    }
    
    private struct PokemonCardDTO: Decodable {
        let id: String
        let name: String
        let images: Images
        
        struct Images: Decodable {
            let small: String
        }
    }
    
    var cardDataTask: URLSessionDataTask?
    
    func fetchCards(name: String = "charmander", completion: @escaping ([PokemonCard]) -> Void) {
        call(pokemonName: name) { cards in
            DispatchQueue.main.async {
                completion(cards)
            }
        }
    }
    
    private func call(pokemonName: String, completion: @escaping ([PokemonCard]) -> Void) {
        cardDataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.pokemontcg.io/v2/cards") {
            urlComponents.query = "pageSize=6&q=name:\(pokemonName)"
            guard let url = urlComponents.url else { return }
            cardDataTask = URLSession(configuration: .default).dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                    DispatchQueue.main.async {
                        if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                            completion(self.decodeResponse(responseData: data))
                        }
                    }
                }
            }
        cardDataTask?.resume()
    }
    
    private func decodeResponse(responseData: Data) -> [PokemonCard] {
        var pokemons: [PokemonCard] = []
        let cardsData = try? JSONDecoder().decode(PokemonCardDataDTO.self, from: responseData)
        // Change the name pokeCards to cards and there'll be a Abort Trap: 6 Crash from the compiler. Submit bug report
        guard let pokeCards = cardsData?.data else { return pokemons }
        pokemons = pokeCards.map { card in PokemonCard(title: card.name, imageUrl: card.images.small) }
        return pokemons
    }
}
