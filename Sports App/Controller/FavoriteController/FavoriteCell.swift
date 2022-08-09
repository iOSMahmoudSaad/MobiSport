//
//  FavoriteCell.swift
//  Sports App
//
//  Created by Mahmoud Saad on 07/08/2022.
//

import UIKit
import SDWebImage

class FavoriteCell: UITableViewCell {

    @IBOutlet weak var FvaoriteLeagueName: UILabel!
    
    @IBOutlet weak var FavoriteLeagueImg: UIImageView!
    
    @IBOutlet weak var favoriteYoutube: UIButton!
    
    var favYoutube :String?
    
    
    @IBOutlet weak var LeagueView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
    }
    func setViewfav(leagueNamefav:String ,imageNamefav :String,youtubeLink:String){
    LeagueView!.layer.borderWidth = 1
    LeagueView!.layer.borderColor = UIColor(named: "border")?.cgColor
    LeagueView!.layer.masksToBounds = false
    LeagueView!.layer.cornerRadius = LeagueView.frame.size.height/2
    LeagueView!.clipsToBounds = true
        FvaoriteLeagueName.text = leagueNamefav
         
        FavoriteLeagueImg.sd_setImage(with: URL(string: imageNamefav), placeholderImage: UIImage(named: "no"))
        self.favYoutube = youtubeLink
    }
    @IBAction func FavoriteLeagueYoutube(_ sender: UIButton) {
        if let url = URL(string: "https://\(favYoutube!)") {
                    UIApplication.shared.open(url, options: [:])
                }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
