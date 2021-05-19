//
//  EpisodeTableViewCell.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 24.09.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

/// Ячейка Эпизодов
final class EpisodeTableViewCell: UITableViewCell {
	
	// MARK: - Subviews
	private static let makeLabel: () -> UILabel =  {
		let label = UILabel()
		label.textColor = .red
		label.font = UIFont(name: "Helvetica Neue", size: 15)
		return label
	}
	
	let idLabel = makeLabel()
	let personNameLabel = makeLabel()
	let airDateLabel = makeLabel()
	let episodeLabel = makeLabel()
	let createdLabel = makeLabel()
	
	let titleIdLabel: UILabel = {
		let id = UILabel()
		id.text = "id - >"
		return id
	}()
	
	let titlePersonNameLabel: UILabel = {
		let name = UILabel()
		name.text = "name - >"
		return name
	}()
	
	let titleAirDateLabel: UILabel = {
		let airDate = UILabel()
		airDate.text = "airDate - >"
		return airDate
	}()
	
	let titleEpisodeLabel: UILabel = {
		let episode = UILabel()
		episode.text = "Episolde - >"
		return episode
	}()
	
	let titleCreatedLabel: UILabel = {
		let created = UILabel()
		created.text = "Created - >"
		return created
	}()

	let mainStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.distribution = .fillEqually
		stackView.axis = .horizontal
		stackView.spacing = 4
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	let titleStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.distribution = .fillProportionally
		stackView.axis = .vertical
		stackView.spacing = 4
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	let labelStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.distribution = .fillEqually
		stackView.axis = .vertical
		stackView.spacing = 4
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	//MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private
private extension EpisodeTableViewCell {
	
	func setupView(){
		[idLabel, personNameLabel, airDateLabel, episodeLabel, createdLabel].forEach { labelStackView.addArrangedSubview($0)}
		[titleIdLabel, titlePersonNameLabel, titleAirDateLabel, titleEpisodeLabel, titleCreatedLabel].forEach {titleStackView.addArrangedSubview($0)}
		mainStackView.addArrangedSubview(titleStackView)
		mainStackView.addArrangedSubview(labelStackView)
		
		contentView.backgroundColor = .darkGray
		contentView.layer.cornerRadius = 10
		contentView.addSubview(mainStackView)
		setupConstraints()
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			
			mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			mainStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
			mainStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8)
		])
	}
}
