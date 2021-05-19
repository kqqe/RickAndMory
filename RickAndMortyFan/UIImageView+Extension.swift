//
// 	UIImageView+Extension.swift
//  RickAndMortyFan
//
//  Created by Острожный Анатолий on 13.10.2020.
//  Copyright © 2020 Anatoliy. All rights reserved.
//

import UIKit

/// Расшиерени UIImageView для загрузки изображения
extension UIImageView {
	func downloadedImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) { 
		contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
				else { return }
			DispatchQueue.main.async() {
				self.image = image
			}
		}.resume()
	}
}
