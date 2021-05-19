//
//  DetailsInfoViewController.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 06.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

// Контроллер для детального отображаения параметров персонажа
final class DetailInfoViewController: UIViewController {
    var output: DetailInfoOutput?
    
    // MARK: -  Subviews
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        setupView()
    }
}

// MARK: - Private
private extension DetailInfoViewController {
    func setupConstaints() {
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }

    func setupView() {
        view.backgroundColor = .white
        title = "DetailsInfoViewController"
        view.addSubview(label)
        setupConstaints()
    }
}

//MARK: - DetailsInfoInput
extension DetailInfoViewController: DetailInfoInput {
    
}
