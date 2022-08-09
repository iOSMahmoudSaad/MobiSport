//
//  FavoriteController.swift
//  Sports App
//
//  Created by Mahmoud Saad on 07/08/2022.
//

import UIKit
 import SDWebImage
class FavoriteController: UIViewController  {
  
    

    var fave = [Leaguess]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    
    @IBOutlet weak var emptyFavoriteView: UIView!
    
    @IBOutlet weak var FavoriteTabel: UITableView!
    {
     didSet{
        FavoriteTabel.delegate   = self
        FavoriteTabel.dataSource = self
    }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emptyFavoriteView.isHidden = true

        emptyFav()
    }
    
    func emptyFav(){
        if fave.isEmpty {
            emptyFavoriteView.isHidden = false
        }else{
            emptyFavoriteView.isHidden = true
        }
    }

}
extension FavoriteController :UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fave.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as! FavoriteCell
        let youtubeLink = fave[indexPath.row].strYoutube
        if (youtubeLink!.isEmpty){
            cell.favoriteYoutube.isHidden = true
            
        } else {
            cell.favoriteYoutube.isHidden = false
            cell.favoriteYoutube.tag = indexPath.section
        }
        let name = fave[indexPath.row].strLeague ?? "no name"
        let image = fave[indexPath.row].strBadge ?? " no"
        cell.setViewfav(leagueNamefav: name, imageNamefav: image, youtubeLink: youtubeLink!)
        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        let sportDb = DBManager.sharedInstance
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        fave = sportDb.fetchData(appDelegate: appDelegate)
        FavoriteTabel.reloadData()
        emptyFav()
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Remove") { [self] Action, view, completionHandler in
            DBManager.sharedInstance.delete(league: fave[indexPath.row], indexPath: indexPath, appDelegate: self.appDelegate, delegate: self)
 
        }
        emptyFav()
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let leagueDetail = storyboard?.instantiateViewController(withIdentifier:"DetailsVc")
        as! LeagueDetailsController
        leagueDetail.cellSelect = fave[indexPath.row].idLeague
        leagueDetail.LeagueNames  = fave[indexPath.row].strLeague
        navigationController?.pushViewController(leagueDetail, animated: true)
    }
    
}
extension FavoriteController:DeletionDelegate
{
    func deleteLeagueAtIndexPath(indexPath: IndexPath){
       fave.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.FavoriteTabel.reloadData()
        }
        emptyFav()
    }
}
