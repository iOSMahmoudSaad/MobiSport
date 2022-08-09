//
//  EventContract.swift
//  Sports App
//
//  Created by Mahmoud Saad on 03/08/2022.
//

import Foundation

protocol IEventView
{
    func renderEventView(events: [Eventes])
    func postErrorEventView(error: Error)
}

protocol IEventPresenter
{
    func fetchData(endPoint: String)
    func onSuccess(events: [Eventes])
    func onFail(error: Error)
}

protocol IEventModel { // For Model
    func fetchDataFromApi(endPoint: String)
}

///////////////////Result/////////////////////////////////
protocol IResultView
{
    func renderResultView(Result: [Eventes])
    func postErrorResultView(error: Error)
}

protocol IResultPresenter
{
    func fetchData(endPoint: String)
    func onSuccess(results: [Eventes])
    func onFail(error: Error)
}

protocol IResultModel { // For Model
    func fetchDataFromApi(endPoint: String)
}


////////////////////Team ////////////////////////////
///
protocol ITeamView
{ // For League View
    func renderTeamView(teams: [Teams])
    func postErrorTeamView(error: Error)
}

protocol ITeamPresenter
{
    func fetchData(endPoint: String)
    func onSuccess(teams: [Teams])
    func onFail(error: Error)
}

protocol ITeamModel { // For Model
    func fetchDataFromApi(endPoint: String)
}
