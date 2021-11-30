//
//  Storyboarded.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}

// swiftlint:disable force_cast
public extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]

        // load our storyboard
        let storyboard = UIStoryboard(name: "GenerationsStoryboard", bundle: Bundle(for: self))

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
