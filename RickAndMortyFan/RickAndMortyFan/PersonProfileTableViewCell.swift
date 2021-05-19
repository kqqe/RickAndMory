//
//  PersonProfileTableViewCell.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 10.05.2021.
//  Copyright © 2021 Anatoliy. All rights reserved.
//

import UIKit

/// Ячейка главного экрана
final class PersonProfileTableViewCell: UITableViewCell {
    
    lazy var imageViewPerson: UIImageView = {
        let image = UIImage(named: "335.jpeg")
        let imageViewPerson = UIImageView(image: image)
        imageViewPerson.layer.cornerRadius = imageViewPerson.frame.width / 2
        imageViewPerson.clipsToBounds = true
        imageViewPerson.contentMode = .scaleAspectFit
        imageViewPerson.translatesAutoresizingMaskIntoConstraints = false
        return imageViewPerson
    } ()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Person"
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    private let mainStackView: UIStackView = {
       let stackViewImage = UIStackView()
        stackViewImage.axis = .horizontal
        stackViewImage.distribution = .fillEqually
        stackViewImage.spacing = 20
        stackViewImage.translatesAutoresizingMaskIntoConstraints = false
        return stackViewImage
    }()
    
    func setupData(_ content: CharacterViewModel) {
        guard let url = URL(string: content.image) else { return }
        imageViewPerson.downloadedImage(from: url)
        nameLabel.text = content.name
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PersonProfileTableViewCell {
    func setupView() {
        mainStackView.addArrangedSubview(imageViewPerson)
        mainStackView.addArrangedSubview(nameLabel)
        contentView.addSubview(mainStackView)
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 10
        setupConstraints()
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            mainStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            mainStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
}


