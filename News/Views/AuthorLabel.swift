//
//  AuthorLabel.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/18/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//


import UIKit

class AuthorLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textAlignment = .left
        textColor = .systemRed
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
}
