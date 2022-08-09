//
//  ViewController.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    var sports = [Sport]()
    let reachability = try! Reachability()
    @IBOutlet weak var SportCollection: UICollectionView!
    {
        didSet{
            SportCollection.delegate = self
            SportCollection.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        switch reachability.connection {
          case .wifi:
            
              print("Reachable via WiFi")
          case .cellular:
              print("Reachable via Cellular")
          case .unavailable:
            let alert = UIAlertController(title: "OOPs..", message: "No Connection", preferredStyle: .alert)
            let tryAgain = UIAlertAction(title: "Try Again", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
        })
            alert.addAction(tryAgain)
             DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
                self.SportCollection.reloadData()
                  })
            print("Network not reachable")
          }
        self.title = "Sports"
        let homePresenter: IHomePresenter = HomePresenter(iHomeView: self) // 1
        homePresenter.fetchData(endPoint: "all_sports.php")
      

}

}

extension ViewController :UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate

{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportCell", for: indexPath) as!SportsCollectionViewCell
        
        let name = sports[indexPath.row].strSport
        let image = sports[indexPath.row].strSportThumb
        sportCell.setUpSportsCollectionCell(sportName: name, imageName: image)
        let layer = CAShapeLayer()
        layer.path  = UIBezierPath(roundedRect: sportCell.bounds, byRoundingCorners: [.bottomRight, .topLeft , .bottomLeft ,.topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        layer.fillColor = UIColor.red.cgColor
        sportCell.layer.mask = layer
        sportCell.layer.borderWidth = 2
        sportCell.layer.borderColor = UIColor(named: "light")?.cgColor
        sportCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = sportCell.frame
        rectShape.position = sportCell.center
        rectShape.path = UIBezierPath(roundedRect: sportCell.bounds, byRoundingCorners: [.bottomRight, .topLeft], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        sportCell.layer.mask = rectShape
        sportCell.layer.borderWidth = 4
        sportCell.layer.borderColor = UIColor(named: "light")?.cgColor
        sportCell.layer.cornerRadius = sportCell.frame.width/4
        sportCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
         return sportCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width * 0.47, height: collectionView.frame.size.width * 0.34)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let LeagueVC = self.storyboard?.instantiateViewController(withIdentifier:"LeagueTableVC")
        as! LeaguesViewController
 
         navigationController?.pushViewController(LeagueVC, animated: true)
    }
}
extension ViewController: IHomeView {
    
    func renderHomeView(users: [Sport]) {   //4
        self.sports = users
        DispatchQueue.main.async {
            self.SportCollection.reloadData()
        }
    }
    func postErrorHomeView(error: Error) {
        print(error.localizedDescription)
    }
}
