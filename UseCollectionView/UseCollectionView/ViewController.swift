//
//  ViewController.swift
//  UseCollectionView
//
//  Created by なぐも on 2022/06/06.
//

import UIKit

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @IBOutlet weak var CollectionView: UICollectionView!{
        didSet{
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: (width/2)-50, height: (width/2)-50)
            layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
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
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


