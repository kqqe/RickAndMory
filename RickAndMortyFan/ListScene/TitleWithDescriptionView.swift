//
//  TitleWithDescriptionView.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 13.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

/// Кастомная View для отображения большого заголовка и описания
final class TitleWithDescriptionView: UIView {
    
    // MARK: - Subviews
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 10)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.font = UIFont(name: "Helvetica Neue", size: 10)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }
}

// MARK: - Private
private extension TitleWithDescriptionView {
    
    func setupView() {
        self.addSubview(titleLabel)
        self.addSubview(textLabel)
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 14),
            
            textLabel.topAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            textLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
}

// MARK: - SetupLabelAndText
extension TitleWithDescriptionView {
    func setup(title: String, text: String) {
        titleLabel.text = title
        textLabel.text = text
    }
}
