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
            "Kazybek bi street": northSideRooms,
            "Abylai Khan street": westSideRooms,
            "Tole Bi street": southSideRooms,
            "Panfilov street": eastSideRooms
        ]
    )

    private static let northSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["coworking 1", "coworking #1", "Coworking 1", "co working 1", "cowork 1", "Coworking #1", "Coworking 1", "Cowork 1", "Co working 1"],
            2: ["Press center", "Press center Abay", "Press", "726", "press center Abay", "press center", "press", "coworking 2", "coworking #2", "Coworking 2", "co working 2", "cowork 2", "Coworking #2", "Coworking 2","independence hall", "Independence hall", "Independence", "Hall","independence","hall", "Круглый зал", "круглый зал", "Круглый", "Зал", "круглый", "зал"],
            3: ["378", "325", "324"],
            4: ["419", "420", "421","422", "424", "425", "426", "427", "428", "432", "433", "436", "438", "459"],
            5: []
        ]
    )
    private static let westSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["180", "181", "182","183","184","170","171","172","173","175","177","179","160","161","164","166","168","169","156","157","158","159"],
            2: ["252", "254", "255","256","257","258","259","260","262","263","264","265","268","270","271","272","273","274","275","278","279","280","283","284"],
            3: ["361", "362", "364","365","367","369","370","371","372","379","381","382","383","385","386","387","388","389"],
            4: ["442", "444", "446","447","448","450","451","454","455","456","457","458","459","460","461","462"],
            5: []
        ]
    )
    private static let southSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["146", "147", "148","149","151","152","153"],
            2: ["248", "249", "251"],
            3: ["334", "336","344","347","348","349","349a","349b","349а","349б","351","355","357","358","359"],
            4: ["415", "417", "418","471","472","473","474","476","471","463","464","465","466"],
            5: ["502", "503", "504","505","506","507","508","509","510","511","512","513","514","515","516","517","518","519","520","521","522"]
        ]
    )
    private static let eastSideRooms = StreetDataModel(
        roomsOnFloor: [
            1: ["100", "102", "103","104","106","110","111","112","114","116","117","118","120","122","124","125","127","131","132","133","134","135","136","138","140","142","143"],
            2: ["202", "204", "207","208","211","217","218","220","222","227","230","231","232","233","235","237","238","241","242","243","245"],
            3: ["300", "303", "309","310","311","312","313","314","315","316","317","318","319","321","323","331","333","334","335","336","338","340","343"],
            4: ["400", "401", "402","403","404","405","409","411","413","414","416"],
            5: []
        ]
    )
}
