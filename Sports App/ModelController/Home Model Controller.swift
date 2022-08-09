//
//  Home Model Controller.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class HomeModelController: IHomeModel {
    
    let apiService: ApiServiceForHome = NetworkManagerForHome()
    let iHomePresenter: IHomePresenter
    
    init(iHomePresenter: IHomePresenter)  {
        self.iHomePresenter = iHomePresenter
    }
    
    func fetchDataFromApi(endPoint: String) {    // 3
        apiService.fetchSports(endPoint: endPoint) { users, error in
            if let users = users {
                self.iHomePresenter.onSuccess(users: users)
            }
            if let error = error {
                self.iHomePresenter.onFail(error: error)
            }
        }
    }
    
    
}
