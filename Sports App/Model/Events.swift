//
//  Events.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

struct EventsModel: Codable {
    let events: [Eventes]
    
}

struct Eventes: Codable {
    let strEvent: String?
    let dateEvent: String?
    let strTime: String?
    let strLeague: String?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let intHomeScore: String?
    let intAwayScore: String?
    let idHomeTeam : String?
    let idAwayTeam : String?
}
