//
//  CarouselItemDataModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 26.04.2023.
//

import Foundation

struct CarouselItemDataModel: Codable, Identifiable {
    var id = UUID()
    var image: String?
    var title: String?
    var who: [String]?
    var when: [String]?
    var requirements: [String]?
    var documents: [String]?
    
    enum CodingKeys: String, CodingKey {
        case image, title, who, when, requirements, documents
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decodeIfPresent(String.self, forKey: .image)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        who = try container.decodeIfPresent([String].self, forKey: .who)
        when = try container.decodeIfPresent([String].self, forKey: .when)
        requirements = try container.decodeIfPresent([String].self, forKey: .requirements)
        documents = try container.decodeIfPresent([String].self, forKey: .documents)
        
        id = UUID()
    }
}
