//
//  SportsCollectionViewCell.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import UIKit

 

class SportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sportImage: UIImageView!
    
    @IBOutlet weak var nameLabelView: UIView!
    
    @IBOutlet weak var sportNameLabel: UILabel!
    
    
    func setUpSportsCollectionCell(sportName: String, imageName: String) {
      
        sportNameLabel.text = sportName
      sportImage.sd_setImage(with: URL(string: imageName), placeholderImage: UIImage(named: "no"))
        
      nameLabelView.backgroundColor = UIColor(named: "light")?.withAlphaComponent(0.8)
     nameLabelView.layer.cornerRadius = 20
     nameLabelView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
}
