//
//  LaunchListProtocols.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import Foundation


// MARK: - Interactor
protocol LaunchListInteractorProtocol: AnyObject {
    var delegate: LaunchListInteractorDelegate? { get set }
}

enum LaunchListInteractorOutput {
    case setLoading(Bool)
    case showLaunchList([Launch])
    case showLaunchDetail(Launch)
}

protocol LaunchListInteractorDelegate: AnyObject {
    func handleOutput(_ output: LaunchListInteractorOutput)
}

// MARK: - Presenter

protocol LaunchListPresenterProtocol: AnyObject {
    func load()
    func selectLaunch(at index: Int)
}

enum LaunchListPresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showLaunchList([Launch])
}

// MARK: - View

protocol LaunchListViewProtocol: AnyObject {
    func handleOutput(_ output: LaunchListPresenterOutput)
}

// MARK: - Router

enum LaunchListRoute {
    case detail(Launch)
}

protocol LaunchListRouterProtocol: AnyObject {
    func navigate(to route: LaunchListRoute)
}


