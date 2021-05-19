//
//  MainCollectionViewWithTableViewCell.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 19.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

/// Ячейка персонажа
final class PersonCollectionTableViewCell: UITableViewCell {
    
	/// Модель персонажа
	var characterModelList: [CharacterViewModel]?
	
    // MARK: - Subvies
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 16,
                                           bottom: 0,
                                           right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "LIST")
        return collectionView
     }()
    
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupCell()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension PersonCollectionTableViewCell {
    
    func setupCell() {
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
    }
}

//MARK: - UIDelegateFlowLayout
extension PersonCollectionTableViewCell: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 140)
    }
	
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
}

// MARK: - UICollectionViewDataSource
extension PersonCollectionTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return characterModelList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LIST", for: indexPath)
		guard  let personCell = cell as? PersonCollectionViewCell,
			   let characterModel = characterModelList?[indexPath.row] else {
			fatalError()
		}
		personCell.setupWithModel(characterModel)
        return cell
    }
}
