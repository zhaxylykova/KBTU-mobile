//
//  NewsItemDataModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 09.04.2023.
//

import UIKit

struct NewsItemDataModel: FirestoreDataModel {
    var image: UIImage?
    var title: String
    var description: String
    var date: String
    
    init(data: [String: Any]) {
        self.title = data["title"] as? String ?? ""
        self.description = data["description"] as? String ?? ""
        self.date = data["date"] as? String ?? ""
//        if let imageUrl = data["image_url"] as? String,
//           let imageData = try? Data(contentsOf: URL(string: imageUrl)!) {
//            // convert the image data to a UIImage object
//            self.image = UIImage(data: imageData)
//        }
//        self.image = UIImage(named: "kbtu")
    }
}
