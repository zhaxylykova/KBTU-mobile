//
//  MenuTextField.swift
//  KBTU Mobile
//
//  Created by Altynay on 04.03.2023.
//

import UIKit

class MenuTextField: UITextField {
    var menuOptions = [String]()
    var menuHandler: ((String) -> Void)?
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        showMenu()
        return true
    }

    private func showMenu() {
        let menu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        for option in menuOptions {
            let action = UIAlertAction(title: option, style: .default) { [weak self] _ in
                self?.text = option
                self?.menuHandler?(option)
            }
            menu.addAction(action)
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        menu.addAction(cancel)
        
        if let viewController = window?.rootViewController {
            menu.popoverPresentationController?.sourceView = self
            menu.popoverPresentationController?.sourceRect = CGRect(x: bounds.width, y: 0, width: 0, height: 0)
            menu.popoverPresentationController?.permittedArrowDirections = [.up, .down]
            viewController.present(menu, animated: true, completion: nil)
        }
    }
}
