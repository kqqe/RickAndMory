//
//  MainScreenContentTableView.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 12.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

/// Ячейка коллекции, описывающая персонажа
final class PersonCollectionViewCell: UICollectionViewCell {
    
	
    // MARK: - Subviews
	lazy var imageViewProfile: UIImageView = {
        let imag = UIImage(named: "335.jpeg")
        let imageView = UIImageView(image: imag)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
	}()
    
	lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
		nameLabel.text = "characterModel"
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
    
	/// Наследование от класса с разметой для ячейки
    let lastLocation: TitleWithDescriptionView = {
        let view = TitleWithDescriptionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Наследование от класса с разметой для ячейки
    let firstLastSeen: TitleWithDescriptionView = {
        let view = TitleWithDescriptionView()
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
	
	func setupWithModel(_ viewModel: CharacterViewModel) {
		nameLabel.text = viewModel.name
		raceLabel.text = viewModel.species
		lastLocation.setup(title: "Last Known Location", text: viewModel.origin)
		firstLastSeen.setup(title: "First Seen Label", text: viewModel.location)
		
		guard let url = URL(string: viewModel.image) else { return }
		imageViewProfile.downloadedImage(from: url)
		
		switch viewModel.status {
		case "Alive":
			indication.backgroundColor = .green
		case "Dead":
			indication.backgroundColor = .red
		default:
			indication.backgroundColor = .gray
		}
	}

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
private extension PersonCollectionViewCell {
    
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
        contentView.backgroundColor = .darkGray
        contentView.layer.cornerRadius = 10
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            indication.heightAnchor.constraint(equalToConstant: 10),
            indication.widthAnchor.constraint(equalToConstant: 10),
            
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            mainStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            mainStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
        ])
    }
}
