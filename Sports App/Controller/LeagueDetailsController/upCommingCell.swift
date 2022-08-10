//
//  upCommingCell.swift
//  Sports App
//
//  Created by Mahmoud Saad on 05/08/2022.
//

import UIKit
import SDWebImage

class upCommingCell: UICollectionViewCell {

    
    @IBOutlet weak var imageTeamA: UIImageView!
    
    @IBOutlet weak var nameTeamA: UILabel!
    
    @IBOutlet weak var imageTeamB: UIImageView!
    
    @IBOutlet weak var nameTeamB: UILabel!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var DateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

    func displayImgs(teamAURL: String?, teamBURL: String?) {
        if(teamAURL != nil){
            self.imageTeamA.sd_setImage(with: URL(string: teamAURL!), placeholderImage: UIImage(named: "large"))
        }else{
            self.imageTeamA.image = UIImage(named: "large")
        }
        
        if(teamBURL != nil){
            self.imageTeamB.sd_setImage(with: URL(string: teamBURL!), placeholderImage: UIImage(named: "large"))
        }else{
            self.imageTeamB.image = UIImage(named: "large")
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
}
