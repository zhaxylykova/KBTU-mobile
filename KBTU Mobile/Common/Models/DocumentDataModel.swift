//
//  DocumentDataModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 23.04.2023.
//

import Foundation

struct DocumentDataModel: Identifiable, Codable {
    var id = UUID()
    let name: String
    private var _children: [DocumentDataModel]?
    var children: [DocumentDataModel]? {
        get {
            return _children?.sorted(by: { $0.name > $1.name })
        }
        set {
            _children = newValue
        }
    }
    var icon: String?
    var path: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case _children = "children"
        case icon
        case path
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        if let childrenDict = try container.decodeIfPresent([String: DocumentDataModel].self, forKey: ._children) {
            _children = Array(childrenDict.values)
        }
    }
}
