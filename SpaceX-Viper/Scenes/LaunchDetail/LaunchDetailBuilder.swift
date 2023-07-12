//
//  LaunchDetailBuilder.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import UIKit

final class LaunchDetailBuilder {
    
    static func make(with launch: LaunchPresentation) -> LaunchDetailViewController {
        let viewController = LaunchDetailViewController()
        let presenter = LaunchDetailPresenter(view: viewController, launch: launch)
        viewController.presenter = presenter
        return viewController
    }
}
