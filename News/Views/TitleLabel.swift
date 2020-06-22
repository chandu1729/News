//
//  TitleLabel.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/18/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configure()
    }
    
    private func configure() {
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        font = UIFont.systemFont(ofSize: 25, weight: .bold)
        numberOfLines = 0
    }
}
