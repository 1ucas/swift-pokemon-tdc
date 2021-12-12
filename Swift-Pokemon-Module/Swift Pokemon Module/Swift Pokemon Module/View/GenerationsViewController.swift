//
//  GenerationsViewController.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import UIKit

public class GenerationsViewController: UIViewController, Storyboarded {
        
    private var presenter: GenerationsPresenter?

    @IBOutlet weak var lblPokemonName: UILabel!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var btnNewPokemon: UIButton!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let interactor = GenerationsInteractor()
        presenter = GenerationsPresenter(interactor: interactor, eventProxy: GenerationsEventProxy())
        
        let generations = presenter?.listGenerations()
        
        if let gens = generations {
            lblPokemonName.text = gens.first
        }
        
        presenter?.eventProxy.notify(eventPayload: .error("Hello"))
    }

}
