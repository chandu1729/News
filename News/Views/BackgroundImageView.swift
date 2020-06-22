//
//  BackgroundImageView.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/17/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class BackgroundImageView: UIImageView {
    
    //    let placeholderImage = UIImage(systemName: "pencil.and.ellipsis.rectangle")
    let placeholderImage = UIImage(named: "placeholder")
    let cache = CacheManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        clipsToBounds = true
        layer.cornerRadius = 10
        contentMode = .scaleAspectFill
        image = placeholderImage
    }
    
    func setImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { self.image = image; return }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self.image = image }
        }.resume()
    }
}
