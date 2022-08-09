//
//  Event Model Controller.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

class EventModelController: IEventModel {
   
   let apiService: ApiServiceForEvent = NetworkManagerForEvent()
   let iEventPresenter: IEventPresenter
   
   init(iEventPresenter: IEventPresenter)  {
       self.iEventPresenter = iEventPresenter
   }
   
   func fetchDataFromApi(endPoint: String) {    // 3
       apiService.fetchSports(endPoint: endPoint) { events, error in
           if let Events = events {
               self.iEventPresenter.onSuccess(events: Events)
           }
           if let error = error {
               self.iEventPresenter.onFail(error: error)
           }
       }
   }
}

//////////////////Result///////////////////////////

class ResultModelController: IResultModel {
  
  let apiService: ApiServiceForResult = NetworkManagerForResult()
  let iResultPresenter: IResultPresenter
  
  init(iResultPresenter: IResultPresenter)  {
      self.iResultPresenter = iResultPresenter
  }
  
  func fetchDataFromApi(endPoint: String) {    // 3
      apiService.fetchSports(endPoint: endPoint) { events, error in
          if let Events = events {
              self.iResultPresenter.onSuccess(results: Events)
          }
          if let error = error {
              self.iResultPresenter.onFail(error: error)
          }
      }
  }
}



///////////////////Team////////////////////////////////////////

class TeamModelController: ITeamModel {
  
  let apiService: ApiServiceForTeam = NetworkManagerForTeam()
  let iTeamPresenter: ITeamPresenter
  
  init(iTeamPresenter: ITeamPresenter)  {
      self.iTeamPresenter = iTeamPresenter
  }
  
  func fetchDataFromApi(endPoint: String) {    // 3
      apiService.fetchSports(endPoint: endPoint) { teams, error in
          if let Teams = teams {
              self.iTeamPresenter.onSuccess(teams: Teams)
          }
          if let error = error {
              self.iTeamPresenter.onFail(error: error)
          }
      }
  }
}
