//
//  SchoolDataModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 21.04.2023.
//

struct SchoolData: Codable {
    let staff: [String: Staff]?
    let school: String?
    let category: String?
}

struct Staff: Codable {
    let email: String?
    let name: String?
    let phone: String?
    let position: String?
}
