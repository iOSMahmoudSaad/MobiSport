//
//  Sport.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

struct SportModel: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}
