//
//  ArticleCell.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/17/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {
    
    let backgroundImageView = BackgroundImageView(frame: .zero)
    let titleLabel = TitleLabel(frame: .zero)
    let authorLabel = AuthorLabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubviews(views: backgroundImageView, authorLabel, titleLabel)
        backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            authorLabel.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 30)
        ])
    }
}
