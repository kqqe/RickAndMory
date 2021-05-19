//
//  MainScreenTitleHeaderView.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 06.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

final class MainScreenTitleHeaderView: UIView {

    // MARK: - Subviews
    let titleLabel: UILabel = {
        let label = UILabel()
		label.textColor = .white
		label.font = UIFont(name: "Helvetica Neue", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showAllButton: UIButton = {
        let button = UIButton()
		button.setTitle("Show All", for: .normal)
		button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 12)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}
	
	convenience init() {
		self.init(frame: CGRect.zero)
	}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
private extension MainScreenTitleHeaderView {
    func setupView() {
        addSubview(titleLabel)
        addSubview(showAllButton)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: showAllButton.leftAnchor, constant: -16),
            
            showAllButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            showAllButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            showAllButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
		])
    }
}
