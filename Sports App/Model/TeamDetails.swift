//
//  TeamDetails.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

struct TeamsDeatailsModel: Codable {
    let teams: [TeamDetail]
    
}


struct TeamDetail: Codable {
    let idTeam : String?
    let strTeamBadge: String?
    let strTeam : String?
    let strLeague : String?
    let strStadium : String?
    let intFormedYear :String?
    var strDescriptionEN: String?
    var strGender: String?
    var strSport: String?
    var strCountry: String?
}
