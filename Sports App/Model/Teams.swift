//
//  Teams.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

struct TeamsModel: Codable {
    let teams: [Teams]
    
}


struct Teams: Codable {
    let idTeam : String?
    let strTeamBadge: String?
    let strTeam : String?
    let strLeague : String?
    let strStadium : String?
    let intFormedYear :String?
    let strDescriptionEN: String
    let strGender: String?
    let strSport: String?
    let strCountry: String?

}
