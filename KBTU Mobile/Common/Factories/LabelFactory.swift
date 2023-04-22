//
//  LabelFactory.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import UIKit

enum LabelFontSize: CGFloat {
    case title = 32
    case subtitle = 16
    case body = 14
    case caption = 12
}

public class LabelFactory {
    static func makeDefaultLabel(text: String, fontSize: LabelFontSize) -> UILabel {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: "Poppins-Medium", size: fontSize.rawValue)
        label.textAlignment = .center
        label.text = text
        return label
    }
    
    static func makeBoldLabel(text: String, fontSize: LabelFontSize) -> UILabel {
        let label = makeDefaultLabel(text: text, fontSize: fontSize)
        label.font = UIFont(name: "Poppins-Bold", size: fontSize.rawValue)
        return label
    }
    
    static func makeAttributedLabel(text: String, range: String, link: String = "", fontSize: LabelFontSize) -> UILabel {
        let label = LabelFactory.makeDefaultLabel(text: text, fontSize: fontSize)
        label.isUserInteractionEnabled = true
        let attributedString = NSMutableAttributedString(string: text)
        let range = (attributedString.string as NSString).range(of: range)
        attributedString.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        label.attributedText = attributedString
        return label
    }
}
