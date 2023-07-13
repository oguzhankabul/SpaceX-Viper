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
    func load()
    func selectLaunch(launchPresentation: LaunchPresentation)
    func filterLaunchesByYear(_ year: Int)
    func getAllLaunches()
}

enum LaunchListInteractorOutput {
    case setLoading(Bool)
    case showLaunchList([LaunchPresentation])
    case showLaunchDetail(LaunchPresentation)
    case showError(LaunchServiceError)
    case updatePickerData([Int])
}

protocol LaunchListInteractorDelegate: AnyObject {
    func handleOutput(_ output: LaunchListInteractorOutput)
}

// MARK: - Presenter

protocol LaunchListPresenterProtocol: AnyObject {
    func load()
    func selectLaunch(launchPresentation: LaunchPresentation)
    func filterByLaunchYear(_ year: Int)
}

enum LaunchListPresenterOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showLaunchList([LaunchPresentation])
    case updatePickerData([Int])
}

// MARK: - View

protocol LaunchListViewControllerProtocol: AnyObject {
    func handleOutput(_ output: LaunchListPresenterOutput)
}

// MARK: - Router

enum LaunchListRoute {
    case detail(LaunchPresentation)
}

protocol LaunchListRouterProtocol: AnyObject {
    func navigate(to route: LaunchListRoute)
}


