//
//  KbtuFacesDataModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 24.04.2023.
//

import Foundation

struct KbtuFacesDataModel: Codable {
    let title: String
    let subtitle1: String
    let subtitle2: String
    let subtitle3: String
    let contacts: [String: Contacts]?
    
//    init?(data: [String: Any]) {
//        guard let title = data["title"] as? String,
//              let subtitle1 = data["subtitle1"] as? String,
//              let subtitle2 = data["subtitle2"] as? String,
//              let subtitle3 = data["subtitle3"] as? String,
//              let description = data["description"] as? String else {
//            return nil
//        }
//        self.title = title
//        self.subtitle1 = subtitle1
//        self.subtitle2 = subtitle2
//        self.subtitle3 = subtitle3
//        self.description = description
//    }
}

struct Contacts: Codable {
    let instagram: String?
    let name: String?
    let phone: String?
}
