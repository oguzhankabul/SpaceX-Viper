//
//  Launch.swift
//  SpaceX-Viper
//
//  Created by Oğuzhan Kabul on 12.07.2023.
//

import Foundation

// MARK: - Launch
struct Launch: Codable {
    let flightNumber: Int?
    let missionName: String?
    let missionID: [String]?
    let upcoming: Bool?
    let launchYear: String?
    let launchDateUnix: Int?
    let launchDateUTC: String?
    let launchDateLocal: String?
    let isTentative: Bool?
    let links: Links?
    let details, staticFireDateUTC: String?
    let staticFireDateUnix: Int?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case upcoming
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case links, details
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
    }
}

// MARK: - Links
struct Links: Codable {
    let missionPatch, missionPatchSmall: String?

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
    }
}
