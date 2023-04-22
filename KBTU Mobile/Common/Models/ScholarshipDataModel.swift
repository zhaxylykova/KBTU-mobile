//
//  ScholarshipDataModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 14.04.2023.
//

import Foundation

struct ScholarshipDataModel: FirestoreDataModel, Identifiable {
    var id = UUID()
    var title: String?
    var description: String?
    var conditions: [String]?
    var documents: [String]?
    var source: URL?
    
    init(data: [String: Any]) {
        self.title = data["title"] as? String
        self.description = data["description"] as? String
        self.conditions = data["conditions"] as? [String]
        self.documents = data["documents"] as? [String]
        self.source = URL(string: data["source"] as? String ?? "")
    }
}
