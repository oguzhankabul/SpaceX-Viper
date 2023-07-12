//
//  LaunchListBuilder.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import UIKit

final class LaunchListBuilder {
    
    static func make() -> LaunchListViewController {
        let view = LaunchListViewController()
        let router = LaunchListRouter(view: view)
        let interactor = LaunchListInteractor(service: app.service)
        let presenter = LaunchListPresenter(view: view,
                                            interactor: interactor,
                                            router: router)
        view.presenter = presenter
        return view
    }
}
