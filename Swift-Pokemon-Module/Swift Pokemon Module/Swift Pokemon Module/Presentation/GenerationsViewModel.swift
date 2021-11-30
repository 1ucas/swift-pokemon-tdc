//
//  GenerationsViewModel.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import Foundation

class GenerationsViewModel {

    private var useCase: GenerationsUseCase

    init(useCase: GenerationsUseCase) {
        self.useCase = useCase
    }
    
    func listGenerations() -> [String] {
        let generation = useCase.execute()
        return [generation]
    }
}
