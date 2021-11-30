//
//  Swift_Pokemon_ModuleTests.swift
//  Swift Pokemon ModuleTests
//
//  Created by Lucas Ramos Maciel on 14/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import XCTest
@testable import Swift_Pokemon_Module

class SwiftPokemonModuleTests: XCTestCase {
    
    var useCase: GenerationsUseCase!
    
    override func setUp() {
        useCase = GenerationsUseCase()
    }

    func testListGenerations() throws {
        XCTAssert(useCase.execute() == "Generation 1")
    }

}
