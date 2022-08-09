//
//  league Model Controller.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class LeagueModelController: IleagueModel {
    
    let apiService: ApiServiceForLeague = NetworkManagerForLeague()
    let iLeaguePresenter: ILeaguePresenter
    
    init(iLeaguePresenter: ILeaguePresenter)  {
        self.iLeaguePresenter = iLeaguePresenter
    }
    
    func fetchDataFromApi(endPoint: String) {    // 3
        apiService.fetchSports(endPoint: endPoint) { leagues, error in
            if let Leagues = leagues {
                self.iLeaguePresenter.onSuccess(leagues: Leagues)
            }
            if let error = error {
                self.iLeaguePresenter.onFail(error: error)
            }
        }
    }
}
