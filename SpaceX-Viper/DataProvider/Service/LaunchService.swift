//
//  LaunchService.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 13.07.2023.
//

import Foundation

protocol LaunchServiceProtocol {
    func fetchLaunchList(completion: @escaping (Result<[Launch], LaunchServiceError>) -> Void)
}

enum LaunchServiceError: Error {
    case urlNotValid
    case other(Error)
}

public final class LaunchService: LaunchServiceProtocol {
    
    private let networkService = NetworkService()
    private let launchesURLString = "https://api.spacexdata.com/v2/launches"
    
    public init() { }
    
    func fetchLaunchList(completion: @escaping (Result<[Launch], LaunchServiceError>) -> Void) {
        guard let url = URL(string: launchesURLString) else {
            completion(.failure(.urlNotValid))
            return
        }
        
        networkService.request(urlRequest: URLRequest(url: url)) { (result: Result<[Launch], Error>) in
            switch result {
            case .success(let launches):
                completion(.success(launches))
            case .failure(let error):
                completion(.failure(.other(error)))
            }
        }
    }
}

