//
//  LeaguesCell.swift
//  Sports App
//
//  Created by Mahmoud Saad on 04/08/2022.
//

import UIKit

class LeaguesCell: UITableViewCell {
    
    var youtubeLink: String = ""
    @IBOutlet weak var leagueNameLabel: UILabel!
    
    @IBOutlet weak var leagueIView: UIView!
    
    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var youtubeButton: UIButton!
    
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    func setUpLeaguesTableCell(leagueName: String, imageName: String, youtubeLink: String) {
        leagueIView!.layer.borderWidth = 1
        leagueIView!.layer.borderColor = UIColor(named: "border")?.cgColor
        leagueIView!.layer.masksToBounds = false
        leagueIView!.layer.cornerRadius = leagueIView.frame.size.height/2
        leagueIView!.clipsToBounds = true
        
        leagueNameLabel.text = leagueName
         
        leagueImage.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage(named: "no"))
        self.youtubeLink = youtubeLink
    }
    
    
    @IBAction func youtubeButtonPress(_ sender: UIButton) {
        if let url = URL(string: "https://\(youtubeLink)") {
                    UIApplication.shared.open(url, options: [:])
                }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

 
    }

}
