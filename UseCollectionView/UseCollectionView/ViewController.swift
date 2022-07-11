//
//  ViewController.swift
//  UseCollectionView
//
//  Created by なぐも on 2022/06/06.
//

import UIKit

//Dataを構造体で受け取る
struct Qiita:Codable{
    let title:String
    let createdAt:String
    let user: User
    
    enum CodingKeys:String, CodingKey{
        case title = "title"
        case createdAt = "created_at"
        case user = "user"
    }
}

struct User:Codable{
    let name:String
    let profileImageUrl:String
    
    enum CodingKeys:String, CodingKey{
        case name = "name"
        case profileImageUrl = "profile_image_url"
    }
}

var QiitaTitle = ""

class ViewController: UIViewController {
    private var qiitas = [Qiita]()
    

    
    let textArray = ["いちご", "ぶどう", "れもん", "りんご", "ばなな"]
    
    let imageArray = ["Banana-Single.jpg","remon.jpeg","grape.jpeg"]
    
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
        getQiitaAPI()
        
    }
    
}

private func getQiitaAPI(){
    guard let url = URL(string: "https://qiita.com/api/v2/items?page=1&per_page=1")else {return}
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: url){(data, respose, err) in
        if let err = err{
            print("情報の取得に失敗しました。 :", err)
            return
        }
        if let data = data{
            do{
                let qiita = try JSONDecoder().decode([Qiita].self, from: data)
                QiitaTitle = qiita.first?.user.name ?? ""
                print("json: ", qiita)
            }catch(let err){
                print("情報の取得に失敗しました。:", err)
            }
        }
    }
    
    task.resume()
}



extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! CollectionViewCell
        
//        cell.qiita = qiitas[indexPath.row]
        cell.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowRadius = 8.0
        //        cell.backgroundColor = UIColor.blue
        
        //とりあえず配列からランダムでテキスト、画像を選んでいる
        let imageSelect:String = imageArray.randomElement() ?? "Banana-Single.jpg"
        let sampleImage = UIImage(named: imageSelect)
        let image = (cell.contentView.viewWithTag(2) as! UIImageView)
        image.image = sampleImage!
        
        let label = (cell.contentView.viewWithTag(1) as! UILabel)
//        label.text = textArray.randomElement()
        
        
        
        label.text = QiitaTitle
        
        image.layer.cornerRadius = image.frame.height*0.4
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

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
    
    var qiita: Qiita? {
        didSet {
            bodyTextLabel.text = qiita?.title
            let url = URL(string: qiita?.user.profileImageUrl ?? "")
            do {
                let data = try Data(contentsOf: url!)
            }catch let err {
                print("Error : \(err.localizedDescription)")
            }
        }
    }
}
}


