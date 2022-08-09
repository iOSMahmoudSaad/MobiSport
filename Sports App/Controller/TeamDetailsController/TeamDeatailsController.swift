//
//  TeamDeatailsController.swift
//  Sports App
//
//  Created by Mahmoud Saad on 07/08/2022.
//

import UIKit
import SDWebImage

class TeamDeatailsController: UIViewController {
    
    var TeamLeague12 : String?
    var TeamImage12 : String?
    var TeamYear12: String?
    var TeamStadium12 : String?
    var TeamName12 : String?
    var TeamSport12 :String?
    var TeamInformedYear12 :String?
    var TeamDescription12 : String?
    
    
    
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamSport: UILabel!
    
    @IBOutlet weak var teamLeague: UILabel!
    
    @IBOutlet weak var teamInformedYear: UILabel!
    
    @IBOutlet weak var teamStadium: UILabel!

    @IBOutlet weak var teamDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string: TeamImage12 ?? "")
        teamImage.sd_setImage(with:imageURL)
        teamName.text         = TeamName12
        teamSport.text        = TeamSport12
        teamLeague.text       = TeamLeague12
        teamInformedYear.text = TeamInformedYear12
        teamStadium.text      = TeamStadium12
        teamDescription.text  = TeamDescription12
    }
    
     
    

}
