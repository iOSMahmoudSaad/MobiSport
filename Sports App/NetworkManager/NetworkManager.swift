//
//  NetworkManager.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class NetworkManagerForHome: ApiServiceForHome {
    
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServicesForHome(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:SportModel! = convertFromJson(data: data)
                    completion(decodedArray.sports,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}


class NetworkManagerForLeague: ApiServiceForLeague {
   
    func fetchSports(endPoint: String, completion: @escaping (([League]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServicesForLeague(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:LeguesModel! = convertFromJson(data: data)
                    completion(decodedArray.countries,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}


class NetworkManagerForEvent: ApiServiceForEvent {
   
    func fetchSports(endPoint: String, completion: @escaping (([Eventes]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServicesForEvent(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:EventsModel! = convertFromJson(data: data)
                    completion(decodedArray?.events,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}
class NetworkManagerForResult: ApiServiceForResult {
   
    func fetchSports(endPoint: String, completion: @escaping (([Eventes]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServicesForEvent(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:EventsModel! = convertFromJson(data: data)
                    completion(decodedArray.events,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}


class NetworkManagerForTeam: ApiServiceForTeam {
   
    func fetchSports(endPoint: String, completion: @escaping (([Teams]?, Error?) -> Void)) {
  
        if let  url = URL(string: UrlServicesForEvent(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let decodedArray:TeamsModel! = convertFromJson(data: data)
                    completion(decodedArray.teams,nil)
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}

