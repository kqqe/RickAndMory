//
//  MainScreenContentTableView.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 12.08.2020.
//  Copyright © 2020 Sberbank. All rights reserved.
//

import UIKit

final class ListContentCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Subviews
    let imageViewProfile: UIImageView = {
        let imag = UIImage(named: "335.jpeg")
        let imageView = UIImageView(image: imag)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Name Label"
        nameLabel.textColor = .white
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    let indication: UIView = {
       let indication =  UIView()
        indication.backgroundColor = .green
        indication.layer.cornerRadius = 5
        indication.clipsToBounds = true
        return indication
    }()

    let raceLabel: UILabel = {
        let raceLabel = UILabel()
        raceLabel.text = "Race Label"
        raceLabel.textColor = .white
        raceLabel.font = UIFont(name: "Helvetica Neue", size: 10)
        raceLabel.translatesAutoresizingMaskIntoConstraints = false
        return raceLabel
    }()
    
    let lastLocation: TitleWithDescriptionView = {
        let view = TitleWithDescriptionView()
        view.setup(title: "Last Known Location", text: "Result Last Location Label")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstLastSeen: TitleWithDescriptionView = {
        let view = TitleWithDescriptionView()
        view.setup(title: "First Seen Label", text: "Result First Label")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainStackView: UIStackView = {
       let stackViewImage = UIStackView()
        stackViewImage.axis = .horizontal
        stackViewImage.distribution = .fillEqually
        stackViewImage.spacing = 20
        stackViewImage.translatesAutoresizingMaskIntoConstraints = false
        return stackViewImage
    }()
    
    private let allLabelsStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let lifeStatusStackView: UIStackView = {
        let container = UIStackView()
        container.distribution = .fillProportionally
        container.axis = .horizontal
        container.spacing = 4
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
private extension ListContentCollectionViewCell {
    
    func addStackView() {
        allLabelsStackView.addArrangedSubview(nameLabel)
        allLabelsStackView.addArrangedSubview(lifeStatusStackView)
        allLabelsStackView.addArrangedSubview(lastLocation)
        allLabelsStackView.addArrangedSubview(firstLastSeen)
    }
    
    func setupView() {
        lifeStatusStackView.addArrangedSubview(indication)
        lifeStatusStackView.addArrangedSubview(raceLabel)
        addStackView()
        mainStackView.addArrangedSubview(imageViewProfile)
        mainStackView.addArrangedSubview(allLabelsStackView)
        contentView.addSubview(mainStackView)
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            indication.heightAnchor.constraint(equalToConstant: 10),
            indication.widthAnchor.constraint(equalToConstant: 10),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            mainStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            mainStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }
}
