//
//  LaunchDetailViewController.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import UIKit

final class LaunchDetailViewController:UIViewController, LaunchDetailViewControllerProtocol {
    
    var presenter: LaunchDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
    
    func update(_ presentation: LaunchPresentation) {
        //view.title = presentation.title
    }
    
    
    
}
