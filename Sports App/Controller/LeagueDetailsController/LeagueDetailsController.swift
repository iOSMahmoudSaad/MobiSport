//
//  LeagueDetailsController.swift
//  Sports App
//
//  Created by Mahmoud Saad on 05/08/2022.
//

import UIKit

class LeagueDetailsController: UIViewController {
    var cellSelect : String?
    var LeagueNames :String?
    var LeagueImages : String?
    var LeagueYoutubeButton :String?
    var idLeague:String?
    
   
    @IBOutlet weak var upCommingCollection: UICollectionView!
    {
        didSet{
            upCommingCollection.delegate = self
            upCommingCollection.dataSource = self
        }
    }
    @IBOutlet weak var resultsCollection: UICollectionView!
    {
        didSet{
            resultsCollection.delegate  = self
            resultsCollection.dataSource = self
        }
    }
    
    @IBOutlet weak var teamsCV: UICollectionView!
    {
        didSet{
            teamsCV.delegate = self
            teamsCV.dataSource = self
        }
    }
    var teams : [Teams]?
    var upComingEvents = [Eventes]()
    var events = [Eventes]()
    var teamss = [Teams]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBarController?.tabBar.isHidden = true
        
        upCommingCollection.register(UINib(nibName: "upCommingCell", bundle: nil), forCellWithReuseIdentifier: "upCommingCell")
        resultsCollection.register(UINib(nibName: "EventCell", bundle: nil), forCellWithReuseIdentifier: "EventCell")
        teamsCV.register(UINib(nibName: "TeamCell", bundle: nil), forCellWithReuseIdentifier: "teamCell")
        
        let EventPresenter: IEventPresenter = EventPresenter(iEventView: self) // 1
        EventPresenter.fetchData(endPoint: "eventsseason.php?id=\(cellSelect!)" )
        
        let ResultPresenter: IResultPresenter = ResultPresenter(iResultView: self) //1
        ResultPresenter.fetchData(endPoint: "eventsseason.php?id=\(cellSelect!)" )
       
        let TeamPresenter: ITeamPresenter = TeamPresenter(iTeamView: self)// 1
        TeamPresenter.fetchData(endPoint: "search_all_teams.php?l=English%20Premier%20League")

         
    }
    

    @IBAction func FavoriteAction(_ sender: Any) {
        
        
    }
    

}
extension LeagueDetailsController :
    UICollectionViewDelegate, UICollectionViewDataSource
{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return upComingEvents.count
        case 1:
            return events.count
        default:
            return teamss.count
        }
        
    }
    
    func getTeamLogo(id: String) ->String{
        let num = self.teams?.count ?? 0
        for index in 0..<num{
            let team = self.teams![index]
            if(team.idTeam == id){
                return team.strTeamBadge!
            }
        }
        return ""
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (collectionView) {
        case upCommingCollection :
            let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "upCommingCell", for: indexPath) as! upCommingCell
            let event = upComingEvents[indexPath.row]
            eventCell.displayImgs(teamAURL: self.getTeamLogo(id: event.idHomeTeam ?? ""), teamBURL: self.getTeamLogo(id: event.idAwayTeam ?? ""))
            eventCell.displayNames(teamA: event.strHomeTeam ?? "", teamB: event.strAwayTeam ?? "")
            eventCell.displayDateTime(date: event.dateEvent, time: event.strTime)
            eventCell.layer.borderWidth = 2
            eventCell.layer.borderColor = UIColor(named: "light")?.cgColor
            eventCell.layer.cornerRadius = 12
            return eventCell
        case resultsCollection:
            let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCell
            let event = events[indexPath.row]
            eventCell.displayImgs(teamAURL: self.getTeamLogo(id: event.idHomeTeam ?? ""), teamBURL: self.getTeamLogo(id: event.idAwayTeam ?? ""))
            eventCell.displayNames(teamA: event.strHomeTeam ?? "", teamB: event.strAwayTeam ?? "")
            eventCell.displayResults(teamARes: event.intHomeScore, teamBRes: event.intAwayScore)
            eventCell.displayDateTime(date: event.dateEvent, time: event.strTime)
            eventCell.layer.borderWidth = 2
            eventCell.layer.borderColor = UIColor(named: "light")?.cgColor
            eventCell.layer.cornerRadius = 12

            return eventCell

        case teamsCV :
            let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCell
      
            eventCell.updateCell(teamImage:teamss[indexPath.row].strTeamBadge!)
            eventCell.layer.borderWidth = 2
            eventCell.layer.borderColor = UIColor(named: "light")?.cgColor
            eventCell.layer.cornerRadius = 12

            return eventCell
        default:
            let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCell
           
            return eventCell
        }
    }
    
    
    
}
extension LeagueDetailsController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 0:
            return CGSize(width: collectionView.frame.size.height * 1.2, height: collectionView.frame.size.height - 24)
        
        case 1:
 
            return CGSize(width: (collectionView.frame.width) - 26.5 , height: 200)
            
        default:
            return CGSize(width: collectionView.frame.size.width * 0.9, height: collectionView.frame.size.height - 35)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView.tag {
        case 3:
            return 24
        default:
            return 8
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
}
extension LeagueDetailsController : IEventView
{
    func renderEventView(events: [Eventes]) {
        self.upComingEvents = events
        DispatchQueue.main.async {
            self.upCommingCollection.reloadData()
        }
    }
    
    func postErrorEventView(error: Error) {
        print(error.localizedDescription)
    }
     
     
    }
extension LeagueDetailsController:IResultView
{
    func renderResultView(Result: [Eventes]) {
        self.events = Result
        DispatchQueue.main.async {
            self.resultsCollection.reloadData()
        }
    }
    func postErrorResultView(error: Error) {
        print(error.localizedDescription)

    }
}
 
extension LeagueDetailsController : ITeamView
{
    func renderTeamView(teams: [Teams]) {
        self.teamss = teams
        DispatchQueue.main.async {
            self.teamsCV.reloadData()
        }
    }

    func postErrorTeamView(error: Error) {
        print(error.localizedDescription)
    }


    }
