//
//  LaunchPresentation.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import UIKit

// MARK: - LaunchPresentation

struct LaunchPresentation {
    let flightNumber: Int
    let missionName: String
    let missionID: [String]
    let upcoming: Bool
    let launchYear: String
    let launchDateUnix: Int
    let launchDateUTC: String
    let launchDateLocal: Date
    let isTentative: Bool
    let links: LinksPresentation
    let details: String
    let staticFireDateUTC: String
    let staticFireDateUnix: Int

    init(launch: Launch) {
        flightNumber = launch.flightNumber ?? 0
        missionName = launch.missionName ?? ""
        missionID = launch.missionID ?? []
        upcoming = launch.upcoming ?? false
        launchYear = launch.launchYear ?? ""
        launchDateUnix = launch.launchDateUnix ?? 0
        launchDateUTC = launch.launchDateUTC ?? ""
        launchDateLocal = launch.launchDateLocal ?? Date()
        isTentative = launch.isTentative ?? false
        details = launch.details ?? ""
        staticFireDateUTC = launch.staticFireDateUTC ?? ""
        staticFireDateUnix = launch.staticFireDateUnix ?? 0
        links = LinksPresentation(links: launch.links)
    }
}

// MARK: - LinksPresentation

struct LinksPresentation {
    let missionPatch: UIImage
    let missionPatchSmall: UIImage

    init(links: Links?) {
        if let missionPatchURL = links?.missionPatch,
           let missionPatchImageURL = URL(string: missionPatchURL),
           let missionPatchImageData = try? Data(contentsOf: missionPatchImageURL),
           let missionPatchImage = UIImage(data: missionPatchImageData) {
            missionPatch = missionPatchImage
        } else {
            missionPatch = UIImage(named: "checkmark")!
        }
        //TODO - KF and Cache asdsafsd
        if let missionPatchSmallURL = links?.missionPatchSmall,
           let missionPatchSmallImageURL = URL(string: missionPatchSmallURL),
           let missionPatchSmallImageData = try? Data(contentsOf: missionPatchSmallImageURL),
           let missionPatchSmallImage = UIImage(data: missionPatchSmallImageData) {
            missionPatchSmall = missionPatchSmallImage
        } else {
            missionPatchSmall = UIImage(named: "checkmark")!
        }
    }
}
