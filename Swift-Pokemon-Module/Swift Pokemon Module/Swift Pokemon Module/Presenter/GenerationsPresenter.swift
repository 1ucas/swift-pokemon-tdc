//
//  GenerationsViewModel.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import Foundation

class GenerationsPresenter: EventHandler {
    
    let eventProxy: GenerationsEventProxy

    private var interactor: GenerationsInteractor

    init(interactor: GenerationsInteractor, eventProxy: GenerationsEventProxy) {
        self.interactor = interactor
        self.eventProxy = eventProxy
    }
    
    func listGenerations() -> [String] {
        let generation = interactor.execute()
        return [generation]
    }
    
    func processSubscriptions() {
        eventProxy.subscribe { [weak self] (payload) in
        }
    }
}
