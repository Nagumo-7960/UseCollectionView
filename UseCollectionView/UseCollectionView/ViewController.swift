//
//  ViewController.swift
//  UseCollectionView
//
//  Created by なぐも on 2022/06/06.
//

import UIKit

class ViewController: UIViewController {
    let textArray = ["いちご", "ぶどう", "れもん", "りんご", "ばなな"]
    
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var CollectionView: UICollectionView!{
        didSet{
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: (width/2)-10, height: (width/2)-10)
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 30
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            CollectionView.collectionViewLayout = layout
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}



extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.shadowOffset = CGSize(width: 1, height: 1)
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowRadius = 5.0
        //        cell.backgroundColor = UIColor.blue
        
        let sampleImage = UIImage(named: "Banana_Single.jpg")
        //        let image = (cell.contentView.viewWithTag(2) as! UIImageView)
        //        image.image = sampleImage!
        
        let label = (cell.contentView.viewWithTag(1) as! UILabel)
        label.text = textArray.randomElement()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


