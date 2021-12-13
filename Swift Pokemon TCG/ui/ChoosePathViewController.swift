//
//  ChoosePathViewController.swift
//  Swift Pokemon TCG
//
//  Created by Lucas Ramos Maciel on 14/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import UIKit
import SwiftPokemonModule
import SwiftTCGModule
import SwiftUI

class ChoosePathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startPokemonFeature(_ sender: Any) {
        
        let vc = GenerationsWireframe.createGenerationsViperModule()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func startPokemonTCG(_ sender: UIButton) {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        let vc = PokemonTCGViewController()
                
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func startAsyncPokemonTCG(_ sender: UIButton) {
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
                
        let swiftUIView = PokemonTCGSwiftView()
        let vc = UIHostingController.init(rootView: swiftUIView)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
