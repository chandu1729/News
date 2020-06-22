//
//  UIHelper.swift
//  News
//
//  Created by chandrasekhar yadavally on 6/16/20.
//  Copyright © 2020 chandrasekhar yadavally. All rights reserved.
//

import UIKit

enum UIHelper {
    static func createFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = min(view.bounds.width, view.bounds.height)
        let padding: CGFloat = 15
        let spacing: CGFloat = 20
        let availableWidth = width - (2 * padding) - (2 * spacing)
        let cellWidth = availableWidth * 0.85
        let cellHeight = view.bounds.height * 0.65
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding * 0.7, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }
}
