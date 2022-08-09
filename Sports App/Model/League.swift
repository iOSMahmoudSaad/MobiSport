//
//  League.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

struct LeguesModel: Codable {
    let countries: [League]
    
}

struct League: Codable {
    let idLeague: String?
    let strLeague: String?
    let strSport: String?
    let strLeagueAlternate: String?
    let strBadge: String?
    let strYoutube: String?
}
