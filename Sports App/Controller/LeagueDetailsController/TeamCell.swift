//
//  TeamCell.swift
//  Sports App
//
//  Created by Mahmoud Saad on 06/08/2022.
//

import UIKit

class TeamCell: UICollectionViewCell {
    @IBOutlet weak var teamImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
     
     func updateCell(teamImage: String){
         let img = NSURL(string: teamImage)! as URL
         self.teamImg.sd_setImage(with: img, completed: nil)
     }
    
}
