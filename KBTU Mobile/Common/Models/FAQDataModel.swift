//
//  FAQDataModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 13.06.2023.
//

struct FAQDataModel: Codable {
    var title: String?
    var description: String?
    var values: [String: String]?
    var boolDict: [String: Bool]?

    enum CodingKeys: String, CodingKey {
        case title, description, values
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        values = try container.decodeIfPresent([String: String].self, forKey: .values)
        if var updatedValues = values {
            for (key, value) in updatedValues {
                updatedValues[key] = value.replacingOccurrences(of: "\\n", with: "\n")
            }
            values = updatedValues
        }
        boolDict = values?.reduce(into: [String: Bool]()) { result, pair in
            result[pair.key] = false
        }
    }
}
