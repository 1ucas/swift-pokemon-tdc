//
//  PokemonTCGAsyncService.swift
//  SwiftTCGModule
//
//  Created by Lucas Ramos Maciel on 29/11/21.
//

import UIKit

actor PokemonTCGAsyncService {
    
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
        
    func fetchCards(name: String = "charmander") async -> [PokemonCard] {
        let cards = await call(pokemonName: name)
        return cards
    }
    
    private func call(pokemonName: String) async -> [PokemonCard] {
        let fetchTask = Task { () -> [PokemonCard] in
            if var urlComponents = URLComponents(string: "https://api.pokemontcg.io/v2/cards") {
                urlComponents.query = "pageSize=6&q=name:\(pokemonName)"
                guard let url = urlComponents.url else { return [] }
                do {
                    let (response, _) = try await URLSession(configuration: .default).data(from: url, delegate: nil)
                    return self.decodeResponse(responseData: response)
                } catch {
                    return []
                }
            } else {
                return []
            }
        }
        // cooperative cancellation
        // https://www.hackingwithswift.com/quick-start/concurrency/how-to-cancel-a-task
        let list = await fetchTask.value
        // fetchTask.cancel()
        return list
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


/// Exemplo de Função de Delay usando Async
///
/// Alternativas:
///   ```swift
///
///    // Atual, com tratamento de erro
///    do {
///      try await withCheckedThrowingContinuation { c in
///         DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
///              c.resume()
///           // c.resume(with: .success(""))
///           // c.resume(throwing: .DecodingError)
///         }
///      }
///    } catch {}
///
///    // alternativa sem throw
///    await withCheckedContinuation { c in
///        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
///            c.resume()
///        }
///    }
///
///    //   more performance / unsafe (trivial for normal usage)
///    await withUnsafeContinuation { c in
///        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
///            c.resume()
///        }
///    }
///   ```
///
/// A implementação ainda usa completions, mas a interface já é usando as novas APIs de  Concurrency
public func delayCall() async {
    // make sure you call resume 1x and only once
    do {
        try await withCheckedThrowingContinuation { c in
            DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                c.resume()
//                c.resume(with: .success(""))
//                c.resume(throwing: .DecodingError)
            }
        }
    } catch {}
}
