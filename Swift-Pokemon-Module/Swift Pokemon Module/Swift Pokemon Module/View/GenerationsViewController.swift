//
//  GenerationsViewController.swift
//  Swift Pokemon Module
//
//  Created by Lucas Ramos Maciel on 18/10/20.
//  Copyright © 2020 Lucas Ramos Maciel. All rights reserved.
//

import UIKit
import Combine

public class GenerationsViewController: UIViewController, Storyboarded {
        
    var presenter: GenerationsPresenter?
    private var cancellable: AnyCancellable?

    @IBOutlet weak var lblPokemonName: UILabel!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblError: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        cancellable = presenter?.$state.sink { [weak self] state in
            self?.handleState(state)
        }
        
        Task { await presenter?.viewDidLoad() }
    }
    
    
    @IBAction func didClickedRandomize(_ sender: Any) {
        showLoading()
        Task { await presenter?.loadNextPokemon() }
    }
    
    private func handleState(_ state: GenerationsState) {
        switch state {
            case .loading:
            self.showLoading()
            case .error:
            self.showError()
            case .idle(let viewModel):
            self.updatePokemon(viewModel)
        }
    }
    
    private func showLoading() {
        hideError()
        actIndicator.startAnimating()
        actIndicator.isHidden = false
    }
    
    private func hideLoading() {
        actIndicator.stopAnimating()
        actIndicator.isHidden = true
    }
    
    private func showError() {
        hideLoading()
        lblError.isHidden = false
    }
    
    private func hideError() {
        lblError.isHidden = true
    }
    
    private func updatePokemon(_ viewModel: PokemonViewModel) {
        hideLoading()
        hideError()
        lblPokemonName.text = viewModel.title
        UIImage.loadFrom(url: viewModel.imageUrl) { image in
            self.imgPokemon.image = image
        }
    }

}
