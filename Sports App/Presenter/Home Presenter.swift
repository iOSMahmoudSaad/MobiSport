//
//  Home Presenter.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class HomePresenter: IHomePresenter {
    
    let iHomeView: IHomeView
    
    init(iHomeView: IHomeView) {
        self.iHomeView = iHomeView
    }
    
    func fetchData(endPoint: String) {
        let homeModel = HomeModelController(iHomePresenter: self) // 2
        homeModel.fetchDataFromApi(endPoint: endPoint)
    }
    
    func onSuccess(users: [Sport]) {
        iHomeView.renderHomeView(users: users)
    }
    
    func onFail(error: Error) {
        iHomeView.postErrorHomeView(error: error)
    }
    
}
