//
//  ListViewController.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 06.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

/// Экран - список персонажей
final class ListViewController: UIViewController {
    var output: ListViewOutput?
    
    // MARK: - Subviews
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.backgroundColor = .black
		tableView.register(EpisodeTableViewCell.self, forCellReuseIdentifier: "Episode")
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        title = "ListViewController"
        setupView()
    }
}

// MARK: - Private
private extension ListViewController {
 
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
    }
    
    func setupView(){
        view.addSubview(tableView)
        tableView.dataSource = self
        setupConstraints()
    }
}

//MARK: - UITableViewDataSourse
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "Episode") as? EpisodeTableViewCell else {
			return UITableViewCell()
		}
		cell.backgroundColor = .black
		return cell
	}
}

//MARK: - ListViewInput
extension ListViewController: ListViewInput {

}
