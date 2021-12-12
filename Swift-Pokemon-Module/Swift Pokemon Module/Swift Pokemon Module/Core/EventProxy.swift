//
//  BaseEventProxy.swift
//  SwiftPokemonModule
//
//  Created by Lucas Ramos Maciel on 12/12/21.
//

import Foundation


//public struct Event<EventName: RawRepresentable> where EventName.RawValue: StringProtocol {
//    let name: EventName
//    let payload: Any
//}
//
//public protocol EventProxy: AnyObject {
//
//    associatedtype EventName: RawRepresentable where EventName.RawValue == String
//
//    typealias EventCallbackClosure = (Event<EventName>) -> Void
//
//    func subscribe(_ listener: @escaping EventCallbackClosure)
//
//    func unsubscribeAll()
//
//    var callbacks: [EventCallbackClosure] { get set }
//
//    var serialQueue: DispatchQueue { get set }
//
//    func notify(eventPayload: Event<EventName>)
//}
//
//public extension EventProxy {
//
//    func subscribe(_ listener: @escaping EventCallbackClosure) {
//        callbacks.append(listener)
//    }
//
//    func unsubscribeAll() {
//        callbacks.removeAll()
//    }
//
//    func notify(eventPayload: Event<EventName>) {
//        serialQueue.sync {
//            callbacks.forEach { $0(eventPayload) }
//        }
//    }
//}
//
//public protocol EventHandler {
//    associatedtype EventProcessor: EventProxy
//    var eventProxy: EventProcessor { get }
//}


public protocol EventProxy: AnyObject {
    
    associatedtype EventyType
         
    typealias EventCallbackClosure = (EventyType) -> Void

    func subscribe(_ listener: @escaping EventCallbackClosure)
    
    func unsubscribeAll()
    
    var callbacks: [EventCallbackClosure] { get set }
    
    var serialQueue: DispatchQueue { get set }
    
    func notify(eventPayload: EventyType)
}

public extension EventProxy {
    
    func subscribe(_ listener: @escaping EventCallbackClosure) {
        callbacks.append(listener)
    }
    
    func unsubscribeAll() {
        callbacks.removeAll()
    }
    
    func notify(eventPayload: EventyType) {
        serialQueue.sync {
            callbacks.forEach { $0(eventPayload) }
        }
    }
}

public protocol EventHandler {
    associatedtype EventProcessor: EventProxy
    var eventProxy: EventProcessor { get }
}
