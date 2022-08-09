//
//  jsonDecoder.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

import Foundation
func convertFromJson<T: Codable>(data: Data) -> T? {
    let jsonDecoder = JSONDecoder()
    let decodedArray = try? jsonDecoder.decode(T.self, from: data)
    return decodedArray
}
