//
//  CollectionViewCell.swift
//  UseCollectionView
//
//  Created by なぐも on 2022/06/13.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 8.0        
    }
}
