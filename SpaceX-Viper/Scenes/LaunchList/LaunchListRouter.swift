//
//  LaunchListRouter.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import UIKit

final class LaunchListRouter: LaunchListRouterProtocol {
    
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: LaunchListRoute) {
        switch route {
        case .detail(let launch):
            let detailView = LaunchDetailBuilder.make(with: launch)
            view.show(detailView, sender: nil)
        }
    }
}
