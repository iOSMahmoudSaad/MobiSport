//
//  Event Presenter.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class EventPresenter: IEventPresenter {
   
    let iEventView: IEventView
    
    init(iEventView: IEventView) {
        self.iEventView = iEventView
    }
    
    func fetchData(endPoint: String) {
        let EventModel = EventModelController(iEventPresenter: self) // 2
        EventModel.fetchDataFromApi(endPoint: endPoint)
    }
    func onSuccess(events: [Eventes]) {
        iEventView.renderEventView(events: events)
        
    }
    
    func onFail(error: Error) {
        iEventView.postErrorEventView(error: error)
    }
}

////////////////////Result/////////////////////////////////////
class ResultPresenter: IResultPresenter {
   
    let iResultView: IResultView
    
    init(iResultView: IResultView) {
        self.iResultView = iResultView
    }
    
    func fetchData(endPoint: String) {
        let ResultModel = ResultModelController(iResultPresenter: self) // 2
        ResultModel.fetchDataFromApi(endPoint: endPoint)
    }
    func onSuccess(results: [Eventes]) {
        iResultView.renderResultView(Result: results)
        
    }
    
    func onFail(error: Error) {
        iResultView.postErrorResultView(error: error)
    }
}

/////////////////////team////////////////////////////////

class TeamPresenter: ITeamPresenter {
  
   
    let iTeamView: ITeamView
    
    init(iTeamView: ITeamView) {
        self.iTeamView = iTeamView
    }
    
    func fetchData(endPoint: String) {
        let TeamModel = TeamModelController(iTeamPresenter: self)// 2
        TeamModel.fetchDataFromApi(endPoint: endPoint)
    }
    func onSuccess(teams: [Teams])
    {
        iTeamView.renderTeamView(teams: teams)
    }
    func onFail(error: Error)
    {
        iTeamView.postErrorTeamView(error: error)
    }
}
