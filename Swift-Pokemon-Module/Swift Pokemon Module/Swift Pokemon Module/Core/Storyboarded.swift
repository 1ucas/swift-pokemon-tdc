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
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "GenerationsStoryboard", bundle: Bundle(for: self))
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
