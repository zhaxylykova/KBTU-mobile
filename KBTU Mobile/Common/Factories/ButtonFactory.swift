//
//  ButtonFactory.swift
//  KBTU Mobile
//
//  Created by Altynay on 24.01.2023.
//

import UIKit

public class ButtonFactory {
    static func makeDefaultButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(named: GlobalConstants.lightPurple)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 16)!
        button.heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        button.widthAnchor
            .constraint(equalToConstant: 280)
            .isActive = true
        return button
    }
}
