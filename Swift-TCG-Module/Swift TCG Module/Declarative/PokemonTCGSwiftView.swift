//
//  PokemonTCGSwiftView.swift
//  PokemonTCGSwiftView
//
//  Created by Lucas Ramos Maciel on 26/08/21.
//

import SwiftUI


/// View Principal do Módulo
///
/// Normalmente carrega um objeto do tipo ``PokemonTCGDeclarativeViewModel``
public struct PokemonTCGSwiftView: View {
        
    @State private var searchText = "charmander"
    
    @StateObject private var viewModel = PokemonTCGDeclarativeViewModel()
    
    public init() {}
    
    public var body: some View {
        ZStack {
            List(viewModel.allCards, id: \.self) { item in
                HStack {
                    AsyncImage(
                        url: URL(string: item.imageUrl),
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                        },
                        placeholder: {
                            ProgressView()
                        })
                    Text(item.title)
                }.frame(height: 100)
            }
            .listStyle(GroupedListStyle())
            .frame(height: viewModel.isLoading ? 0 : nil)
            
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(2.0, anchor: .center)
            }
        }
        .navigationBarTitle("TCG ASYNC")
        .searchable(text: $searchText)
        .disableAutocorrection(true)
        .onChange(of: searchText) { newValue in
            fetchCards(text: newValue)
        }.onAppear { fetchCards(text: searchText) }
    }
    
    private func fetchCards(text: String) {
        Task { await viewModel.fetchCards(searchTerm: searchText) }
    }
}
