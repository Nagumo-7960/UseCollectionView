//
//  CollectionViewCell.swift
//  UseCollectionView
//
//  Created by なぐも on 2022/06/13.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {    required init?(coder aDecoder: NSCoder) {
    
    let bodyTextLabel: UILabel = {
        let label = UILabel()
        label.text = "something in here"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    super.init(coder: aDecoder)
    self.layer.cornerRadius = 8.0
    addSubview(bodyTextLabel)
    
    var qiita: Qiita? {
        didSet {
            bodyTextLabel.text = qiita?.title
            let url = URL(string: qiita?.user.profileImageUrl ?? "")
            do {
                let data = try Data(contentsOf: url!)
                //                        let image = UIImage(data: data)
                //                        userImageView.image = image
            }catch let err {
                print("Error : \(err.localizedDescription)")
            }
        }
    }
}
}
