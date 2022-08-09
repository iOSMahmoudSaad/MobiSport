//
//  ApiServices.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

protocol ApiServiceForHome {
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void))
}

protocol ApiServiceForLeague {
    func fetchSports(endPoint: String, completion: @escaping (([League]?, Error?) -> Void))
}
protocol ApiServiceForEvent {
    func fetchSports(endPoint: String, completion: @escaping (([Eventes]?, Error?) -> Void))
}

protocol ApiServiceForResult {
    func fetchSports(endPoint: String, completion: @escaping (([Eventes]?, Error?) -> Void))
}

protocol ApiServiceForTeam {
    func fetchSports(endPoint: String, completion: @escaping (([Teams]?, Error?) -> Void))
}
 
 
