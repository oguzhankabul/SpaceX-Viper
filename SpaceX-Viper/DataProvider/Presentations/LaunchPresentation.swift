//
//  LaunchPresentation.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import UIKit
import Kingfisher

// MARK: - LaunchPresentation

struct LaunchPresentation {
    let flightNumber: String
    let missionName: String
    let missionID: [String]
    let upcoming: Bool
    let launchYear: String
    let launchDateUnix: String
    let launchDateUTC: String
    let launchDateLocal: String
    let isTentative: Bool
    let links: LinksPresentation
    let details: String
    let staticFireDateUTC: String
    let staticFireDateUnix: String

    init(launch: Launch) {
        flightNumber = launch.flightNumber.toString() ?? "Unknown"
        missionName = launch.missionName ?? "Unknown"
        missionID = launch.missionID ?? []
        upcoming = launch.upcoming ?? false
        launchYear = launch.launchYear ?? "Unknown"
        launchDateUnix = launch.launchDateUnix.toString() ?? "Unknown"
        launchDateUTC = launch.launchDateUTC ?? ""
        launchDateLocal = launch.launchDateLocal ?? "Unknown"
        isTentative = launch.isTentative ?? false
        details = launch.details ?? "Unknown"
        staticFireDateUTC = launch.staticFireDateUTC ?? "Unknown"
        staticFireDateUnix = launch.staticFireDateUnix.toString() ?? "Unknown"
        links = LinksPresentation(links: launch.links)
    }
}

// MARK: - LinksPresentation

struct LinksPresentation {
    let missionPatch: String
    let missionPatchSmall: String

    init(links: Links?) {
        missionPatch = links?.missionPatch ?? ""
        missionPatchSmall = links?.missionPatchSmall ?? ""
    }
}
