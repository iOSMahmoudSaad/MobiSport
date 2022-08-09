//
//  League Presenter.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class LeaguePresenter: ILeaguePresenter {
   
    
    
    let iLeagueView: IleagueView
    
    init(iLeagueView: IleagueView) {
        self.iLeagueView = iLeagueView
    }
    
    func fetchData(endPoint: String) {
        let LeagueModel = LeagueModelController(iLeaguePresenter: self) // 2
        LeagueModel.fetchDataFromApi(endPoint: endPoint)
    }
    func onSuccess(leagues: [League]) {
        iLeagueView.renderHomeView(leagues: leagues)
    }
    
    func onFail(error: Error) {
        iLeagueView.postErrorLeagueView(error: error)
    }
    
    
}
