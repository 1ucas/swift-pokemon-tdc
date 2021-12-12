//
//  GenerationsEventProxy.swift
//  SwiftPokemonModule
//
//  Created by Lucas Ramos Maciel on 12/12/21.
//

import Foundation

public enum GenerationsEventNames: String {
    case loading
}

public struct HelloEvent {
    let text = "Hello"
}

public enum GeenrationEventNamy {
    case loading(Void)
    case error(String)
    case hello(HelloEvent)
}

public final class GenerationsEventProxy: EventProxy {
    public typealias EventyType = GeenrationEventNamy
    
//    public typealias EventName = GenerationsEventNames

    public var callbacks: [EventCallbackClosure] = []
    public var serialQueue: DispatchQueue = DispatchQueue(label: "GenerationsEventProxyQueue")
}


