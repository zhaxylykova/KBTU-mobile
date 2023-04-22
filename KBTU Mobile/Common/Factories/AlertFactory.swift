//
//  AlertFactory.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import UIKit

public final class AlertFactory {
    // MARK: Delete if not needed
    static func makeDefaultAlert(with title: String, message: String = "") -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }
    
    static func getDefaultAlertController(title: String, message: String, actionTitle: String, defaultActionHandler: (() -> ())? = nil
    ) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(getAlertAction(title: actionTitle, actionHandler: defaultActionHandler))
        return alert
    }
    
    static func getAlertAction(title: String, style: UIAlertAction.Style = .cancel, actionHandler: (() -> ())?) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: { _ in actionHandler?() })
        return action
    }
}
