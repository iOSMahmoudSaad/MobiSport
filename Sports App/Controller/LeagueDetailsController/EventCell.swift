//
//  EventCell.swift
//  Sports App
//
//  Created by Mahmoud Saad on 05/08/2022.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    @IBOutlet weak var imageTeamA: UIImageView!

    @IBOutlet weak var nameTeamA: UILabel!
    
    @IBOutlet weak var teamAResView: UIView!
    
    @IBOutlet weak var labelARes: UILabel!
    
    
    @IBOutlet weak var imageTeamB: UIImageView!
    
    @IBOutlet weak var nameTeamB: UILabel!

    @IBOutlet weak var teamBResView: UIView!
    
    @IBOutlet weak var labelBRes: UILabel!
    
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

    
    func displayImgs(teamAURL: String?, teamBURL: String?) {
        if(teamAURL != nil){
            self.imageTeamA.sd_setImage(with: URL(string: teamAURL!), placeholderImage: UIImage(named: "sport"))
        }else{
            self.imageTeamA.image = UIImage(named: "sport")
        }
        
        if(teamBURL != nil){
            
            self.imageTeamB.sd_setImage(with: URL(string: teamBURL!), placeholderImage: UIImage(named: "sport"))
        }else{
            self.imageTeamB.image = UIImage(named: "sport")
        }
    }
    func displayNames(teamA: String, teamB: String) {
        self.nameTeamA.text = teamA
        self.nameTeamB.text = teamB
    }
    
    func displayDateTime(date: String?, time: String?) {
        if(date != nil && date!.count > 1){
            self.DateLabel.text = date!
        }else{
            self.DateLabel.text = "no Date"
        }
        
        if(time != nil && time!.count > 1){
            self.TimeLabel.text = time!
        }else{
            self.TimeLabel.text = "No time"
        }
    }
    func displayResults(teamARes: String?, teamBRes: String?) {
        self.teamAResView.layer.cornerRadius = self.teamAResView.frame.size.width/2
        self.teamBResView.layer.cornerRadius = self.teamBResView.frame.size.width/2
        self.teamAResView.layer.borderWidth = 2
        self.teamAResView.layer.borderColor = UIColor(named: "dark")?.cgColor
        self.teamBResView.layer.borderWidth = 2
        self.teamBResView.layer.borderColor = UIColor(named: "dark")?.cgColor
        
        self.teamAResView.isHidden = false
        self.teamBResView.isHidden = false
        
        if(teamARes != nil){
            self.labelARes.text = teamARes
        }else{
            self.labelARes.text = "N"
        }
        
        if(teamBRes != nil){
            self.labelBRes.text = teamBRes
        }else{
            self.labelBRes.text = "N"
        }
    }
    
}
