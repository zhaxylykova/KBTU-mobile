//
//  FloorDataModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 21.03.2023.
//

import Foundation

struct StreetDataModel {
    var roomsOnFloor: [Int: [String]]
}

struct FloorDataModel {
    var streets: [String: StreetDataModel]
}

