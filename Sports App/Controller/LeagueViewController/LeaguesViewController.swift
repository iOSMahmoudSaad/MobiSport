//
//  LeaguesViewController.swift
//  Sports App
//
//  Created by Mahmoud Saad on 04/08/2022.
//

import UIKit

class LeaguesViewController: UIViewController {
    var leagues = [League]()
    
    @IBOutlet weak var LeagueTableView: UITableView!
    {
        didSet{
            LeagueTableView.delegate = self
            LeagueTableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let leaguePresenter: ILeaguePresenter = LeaguePresenter(iLeagueView: self) // 1
        leaguePresenter.fetchData(endPoint: "search_all_leagues.php?s=Soccer")
    }
    

   

}

extension LeaguesViewController :UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let leagueCell = tableView.dequeueReusableCell(withIdentifier:"lgCell", for: indexPath)as! LeaguesCell
        let youtubeLink = leagues[indexPath.row].strYoutube
        if (youtubeLink!.isEmpty){
            leagueCell.youtubeButton.isHidden = true
            
        } else {
            leagueCell.youtubeButton.isHidden = false
            leagueCell.youtubeButton.tag = indexPath.section
        }
        let name = leagues[indexPath.row].strLeague ?? "no name"
        let image = leagues[indexPath.row].strBadge ?? " no"
        leagueCell.setUpLeaguesTableCell(leagueName: name, imageName: image, youtubeLink: youtubeLink!)
        return leagueCell
    }
    
    
}
extension LeaguesViewController{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(tableView.frame.size.width * 0.3)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
}
extension LeaguesViewController : IleagueView
{
    func renderHomeView(leagues: [League]) {
        self.leagues = leagues
        DispatchQueue.main.async {
            self.LeagueTableView.reloadData()
        }
    }
    
    func postErrorLeagueView(error: Error) {
        print(error.localizedDescription)

    }
    
    
}
