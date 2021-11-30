//
//  PokemonTCGDeclarativeViewModel.swift
//  PokemonTCGDeclarativeViewModel
//
//  Created by Lucas Ramos Maciel on 26/08/21.
//

import Combine

/// View Model principal do módulo
///
/// Um exemplo de uso é o seguinte:
///```swift
///     await PokemonTCGDeclarativeViewModel().fetchCards(searchTerm: "Lucas")
///```
///
///
///  Sem esse ViewModel a aplicação não funciona direito
public class PokemonTCGDeclarativeViewModel : ObservableObject {
    
    @Published var isLoading:Bool = false
    @Published var allCards:[PokemonCard] = []
    
    private let service = PokemonTCGAsyncService()
      
    /// Lista as cartas de Pokemon com base no parametro passado
    ///
    /// Esse método sempre retorna na MainThread por estar marcado com a anotação @MainActor
    ///
    /// - Parameter searchTerm: Nome que deve buscar
    @available(iOS 13.0, *)
    @MainActor
    public func fetchCards(searchTerm: String) async {
        if searchTerm.count > 4 && !isLoading {
            isLoading = true
            let pokemons = await service.fetchCards(name: searchTerm)
            self.isLoading = false
            self.allCards = pokemons
        }
    }
}
