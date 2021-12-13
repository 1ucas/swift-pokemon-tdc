
import Foundation

enum ApiError: Error {
    case general
    case decoding
}

class PokemonApiService {
    
    func fetchPokemon(name: String = "charmander") async throws -> PokemonDTO {
        let pokemon = try await call(pokemonName: name)
        return pokemon
    }
    
    // return nil for simplicity
    private func call(pokemonName: String) async throws -> PokemonDTO {
        let url = URLComponents(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonName)")?.url
        guard let unwrappedUrl = url else { throw ApiError.general }
        return try await withCheckedThrowingContinuation { continuation in
            URLSession(configuration: .default).dataTask(with: unwrappedUrl, completionHandler: {
                data, response, error in
                do {
                    let decodedResponse = try self.decodeResponse(responseData: data)
                    continuation.resume(returning: decodedResponse)
                } catch {
                    continuation.resume(throwing: ApiError.general)
                }
            }).resume()
        }
    }
    
    private func decodeResponse(responseData: Data?) throws -> PokemonDTO {
        guard let unwrappedData = responseData else { throw ApiError.decoding }
        let pokemon = try? JSONDecoder().decode(PokemonDTO.self, from: unwrappedData)
        guard let unwrappedPokemon = pokemon else { throw ApiError.decoding }
        return unwrappedPokemon
    }
}
