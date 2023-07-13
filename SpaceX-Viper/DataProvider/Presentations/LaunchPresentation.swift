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
    let launchYear: String
    let launchDateUnix: String
    let launchDateUTC: String
    let launchDateLocal: String
    let links: LinksPresentation
    let details: String
    let staticFireDateUTC: String
    let staticFireDateUnix: String
    let detailPropertyList: [String]

    init(launch: Launch) {
        flightNumber = launch.flightNumber.toString() ?? "Unknown"
        missionName = launch.missionName ?? "Unknown"
        missionID = launch.missionID ?? ["Unknown"]
        launchYear = launch.launchYear ?? "Unknown"
        launchDateUnix = launch.launchDateUnix.toString() ?? "Unknown"
        launchDateUTC = launch.launchDateUTC ?? ""
        launchDateLocal = launch.launchDateLocal ?? "Unknown"
        details = launch.details ?? "Unknown"
        staticFireDateUTC = launch.staticFireDateUTC ?? "Unknown"
        staticFireDateUnix = launch.staticFireDateUnix.toString() ?? "Unknown"
        links = LinksPresentation(links: launch.links)
        detailPropertyList = [
            "Flight Number: \(flightNumber)",
            "Mission Name: \(missionName)",
            "Launch Year: \(launchYear)",
            "missionID: \(missionID.joined(separator: ","))",
            "Launch Date Unix: \(launchDateUnix)",
            "Launch Date UTC: \(launchDateUTC)",
            "Launch Date Local: \(launchDateLocal)",
            "Static Fire Date UTC: \(staticFireDateUTC)",
            "Static Fire Date Unix: \(staticFireDateUnix)"
        ]
    }
}

// MARK: - LinksPresentation

struct LinksPresentation {
    let missionPatch: URL?
    let missionPatchSmall: URL?

    init(links: Links?) {
        missionPatch = URL(string: links?.missionPatch ?? "")
        missionPatchSmall = URL(string: links?.missionPatchSmall ?? "")
    }
}
