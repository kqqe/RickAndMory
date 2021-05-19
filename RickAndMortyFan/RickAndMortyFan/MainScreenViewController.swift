//
//  MainScreenViewController.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 03.08.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

final class MainScreenViewController: UIViewController {
	
	var output: MainScreenViewOutput?
	private var locationViewModels: [LocationViewModel]?
	private var characterViewModels: [CharacterViewModel]?
	private var episodeViewModels: [EpisodeViewModel]?
    
    // MARK: - Subviews
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
		tableView.estimatedRowHeight = 180
		tableView.estimatedSectionHeaderHeight = 20
        tableView.register(PersonProfileTableViewCell.self, forCellReuseIdentifier: "Collect")
        return tableView
    }()
	
    // MARK: - Lifecycle
    override func viewDidLoad() {
        setupView()
		output?.configureView()
    }
}

// MARK: - Private
private extension MainScreenViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        ])
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        setupConstraints()
    }

    @objc func didTapButton() {
		output?.didTapShowAllButton()
    }
}

// MARK: - UITableViewDataSource
extension MainScreenViewController: UITableViewDataSource {
    
	// TODO обработать сценарий когда не пришли данные
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
        
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "Collect", for: indexPath) as? PersonProfileTableViewCell else {
			return UITableViewCell()
		}
        cell.backgroundColor = .black
        
        // TODO : обработать fatalError
        guard let characterModel = characterViewModels?[indexPath.row] else {
            fatalError()
        }
       // cell.setupData(characterModel)
		return cell
	}
}

// MARK: - UITableViewDelegate
extension MainScreenViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let _ = tableView.cellForRow(at: indexPath) {
            output?.tap()
            }
    }
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let header = MainScreenTitleHeaderView()
		switch section {
		case 0:
			header.titleLabel.text = "Person"
		case 1:
			header.titleLabel.text = "Location"
		case 2:
			header.titleLabel.text = "Episode"
		default:
			header.titleLabel.text = "Not Title"
		}
		header.backgroundColor = .black
		header.showAllButton.addTarget(self, action:#selector(didTapButton), for: .touchUpInside)
		return header
	}
}

//MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {
	
    // TODO:
	func saveLocationViewModels(_ viewModels: [LocationViewModel]) {
		locationViewModels = viewModels
	}
	
	func saveCharacterViewModels(_ viewModels: [CharacterViewModel]) {
		characterViewModels = viewModels
	}
	
	func saveEpisodeViewModels(_ viewModels: [EpisodeViewModel]) {
		episodeViewModels = viewModels
	}
	
	func setupNavBar(with title: String) {
		self.navigationItem.title = title
		self.navigationController?.navigationBar.barTintColor = .black
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
		navigationController?.navigationBar.barStyle = .black
	}
}
