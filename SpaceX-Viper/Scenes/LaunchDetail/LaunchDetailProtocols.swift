//
//  LaunchDetailProtocols.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import UIKit

protocol LaunchDetailPresenterProtocol {
    func load()
}

protocol LaunchDetailViewControllerProtocol: AnyObject {
    func update(_ presentation: LaunchPresentation)
}
