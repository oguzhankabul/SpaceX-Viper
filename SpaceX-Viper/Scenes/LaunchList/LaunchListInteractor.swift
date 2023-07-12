//
//  LaunchListInteractor.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import Foundation

final class LaunchListInteractor: LaunchListInteractorProtocol {
    
    weak var delegate: LaunchListInteractorDelegate?
    
    private let service: LaunchServiceProtocol
    private var launchPresentationList: [LaunchPresentation] = []
    
    init(service: LaunchServiceProtocol) {
        self.service = service
    }
    
    func load() {
        delegate?.handleOutput(.setLoading(true))
        service.fetchLaunchList { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                self.delegate?.handleOutput(.setLoading(false))
                switch result {
                case .success(let launches):
                    self.launchPresentationList = launches.map{( LaunchPresentation(launch: $0) )}
                    self.delegate?.handleOutput(.showLaunchList(self.launchPresentationList))
                case .failure(let error):
                    self.delegate?.handleOutput(.showError(error))
                }
            }
        }
    }
    
    func selectLaunch(at index: Int) {
        let launchPresentation = launchPresentationList[index]
        delegate?.handleOutput(.showLaunchDetail(launchPresentation))
    }
}
