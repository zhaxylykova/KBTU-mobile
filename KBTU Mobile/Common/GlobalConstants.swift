//
//  GlobalConstants.swift
//  KBTU Mobile
//
//  Created by Altynay on 01.03.2023.
//

import UIKit

enum GlobalConstants {
    // MARK: Colors
    static let backgroundColor = "backgroundColor"
    static let lightPurple = "lightPurple"
    static let purple = "purple"
    
    // MARK: SignUp
    static let facultyList = [
        "School of Information Technology and Engineering",
        "School of Energy and Petroleum Industry",
        "School of Mathematic and Cybernetics",
        "School of Geology and Exploration",
        "School of Chemical Engineering",
        "School of Materials Science and Green Technologies",
        "Business School",
        "International School of Economics",
        "Kazakhstan Maritime Academy"
    ]
    static let yeardOfStudy = ["1", "2", "3", "4", "5+"]
    static let currentLanguage = "currentLanguage"
    
    // MARK: News
    
    // MARK: Map
    static let floorNumbers = ["1", "2", "3", "4", "5"]
    
    static let rooms: FloorDataModel = .init(
        streets: [
            "northSideRooms": northSideRooms,
            "westSideRooms": westSideRooms,
            "southSideRooms": southSideRooms,
            "eastSideRooms": eastSideRooms
        ]
    )

    private static let northSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["100", "101", "102"],
            2: ["200", "201", "202"],
            3: ["300", "301", "302"],
            4: ["400", "401", "402"],
            5: ["500", "501", "502"]
        ]
    )
    private static let westSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["103", "104", "105"],
            2: ["203", "204", "205"],
            3: ["303", "304", "305"],
            4: ["403", "404", "405"],
            5: ["503", "504", "505"]
        ]
    )
    private static let southSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["106", "107", "108"],
            2: ["206", "207", "208"],
            3: ["306", "307", "308"],
            4: ["406", "407", "408"],
            5: ["506", "507", "508"]
        ]
    )
    private static let eastSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["109", "110", "111"],
            2: ["209", "210", "211"],
            3: ["309", "310", "311"],
            4: ["409", "410", "411"],
            5: ["509", "510", "511"]
        ]
    )
}
