//
//  PokemonTCGView.swift
//  Swift TCG Module
//
//  Created by Lucas Ramos Maciel on 22/08/21.
//

import UIKit

class PokemonTCGView: UIView {
    
    struct PokemonTCGViewData {
        var allCards: [PokemonCard] = []
        var isLoading = true
    }

    public var model: PokemonTCGViewData {
        didSet {
            updateView()
        }
    }
    
    private lazy var progressView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private lazy var tableView: UITableView = {
        var table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    init(model: PokemonTCGViewData, frame: CGRect = .zero) {
        self.model = model
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = true
        backgroundColor = .white
        addSubviews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    private func addSubviews() {
        addSubview(tableView)
        addSubview(progressView)
    }
    
    private func updateView() {
        if(model.isLoading) {
            progressView.isHidden = false
            tableView.isHidden = true
            progressView.startAnimating()
        } else {
            progressView.stopAnimating()
            progressView.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
        }
    }
    
    private func setupConstrains() {
        progressView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        progressView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        progressView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        progressView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
}

extension PokemonTCGView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.allCards.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = model.allCards[indexPath.row].title
        guard let url = URL(string: model.allCards[indexPath.row].imageUrl) else { return cell }
        UIImage.loadFrom(url: url) { image in
            cell.imageView?.image = image
            cell.setNeedsLayout()
        }
        return cell
    }
}
