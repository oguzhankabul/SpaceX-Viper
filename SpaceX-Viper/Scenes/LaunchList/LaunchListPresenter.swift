//
//  LaunchListPresenter.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import Foundation

final class LaunchListPresenter: LaunchListPresenterProtocol {
    
    private unowned let view: LaunchListViewControllerProtocol
    private let interactor: LaunchListInteractorProtocol
    private let router: LaunchListRouterProtocol
    
    init(view: LaunchListViewControllerProtocol,
         interactor: LaunchListInteractorProtocol,
         router: LaunchListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        
        self.interactor.delegate = self
    }
    
    func load() {
        view.handleOutput(.updateTitle("asdsafsd"))
        interactor.load()
    }
    
    func selectLaunch(at index: Int) {
        interactor.selectLaunch(at: index)
    }
}

extension LaunchListPresenter: LaunchListInteractorDelegate {
    
    func handleOutput(_ output: LaunchListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view.handleOutput(.setLoading(isLoading))
        case .showLaunchList(let launchPresentationList):
            view.handleOutput(.showLaunchList(launchPresentationList))
        case .showLaunchDetail(let launchPresentation):
            router.navigate(to: .detail(launchPresentation))
        case .showError(let launchServiceError):
            print(launchServiceError.localizedDescription)
          // TODO show error  view.showError(launchServiceError.localizedDescription)
        }
    }
}
