//
//  LaunchDetailPresenter.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import Foundation

final class LaunchDetailPresenter: LaunchDetailPresenterProtocol {
    
    unowned var view: LaunchDetailViewController
    private let launch: LaunchPresentation
    
    init(view: LaunchDetailViewController, launch: LaunchPresentation) {
        self.view = view
        self.launch = launch
    }
    
    func load() {
        view.update(launch)
    }
}
