//
//  GenerationsViewController.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import UIKit

public class GenerationsViewController: UIViewController, Storyboarded {
    
    private var viewModel: GenerationsViewModel?

    @IBOutlet weak var lblGenerations: UILabel!

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let useCase = GenerationsUseCase()
        viewModel = GenerationsViewModel(useCase: useCase)
        
        let generations = viewModel?.listGenerations()
        
        if let gens = generations {
            lblGenerations.text = gens.first
        }
    }

}
