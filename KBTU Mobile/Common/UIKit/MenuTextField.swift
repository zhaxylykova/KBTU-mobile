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

// MARK: Changed font for elements in faculty list
extension UIAlertController {
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        for i in self.actions {
            guard let title = i.title else { return }
            var attributedText = NSMutableAttributedString(string: title)
            if GlobalConstants.facultyList.contains(title) {
                attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)])
            }
            let range = NSRange(location: 0, length: attributedText.length)
            attributedText.addAttribute(.foregroundColor, value: UIColor(named: "alertColor"), range: range)
            guard let label = (i.value(forKey: "__representer") as AnyObject).value(forKey: "label") as? UILabel else { return }
            label.numberOfLines = 0
            label.attributedText = attributedText
        }
    }
}
