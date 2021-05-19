//
//  MainCollectionViewWithTableViewCell.swift
//  RickAndMortyFan
//
//  Created by 18574041 on 19.08.2020.
//  Copyright © 2020 Sberbank. All rights reserved.
//

import UIKit

final class PersonCollectionTableViewCell: UITableViewCell{
    
    // MARK: - Subvies
    
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.horizontalScrollIndicatorInsets = .zero
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ListContentCollectionViewCell.self, forCellWithReuseIdentifier: "LIST")
        return collectionView
     }()
    
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubview(collectionView)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
