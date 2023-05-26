//
//  TextFieldFactory.swift
//  KBTU Mobile
//
//  Created by Altynay on 19.02.2023.
//

import UIKit

public class TextFieldFactory {
    private var textField = UITextField()
    
    func makeDefaultTextField(withTitle title: String) -> UITextField {
        textField.attributedPlaceholder = setAttributedText(with: title)
        setDefaultSettings()
        textField.setLeftPaddingPoints(10)
        setSecurity()
        setKeyboardType()
        setConstraints()
        return textField
    }
    
    func makeMenuTextField(withTitle title: String) -> MenuTextField {
        textField = MenuTextField()
        textField.attributedPlaceholder = setAttributedText(with: title)
        setDefaultSettings()
        textField.setLeftPaddingPoints(10)
        setSecurity()
        setKeyboardType()
        setConstraints()
        guard let textField = textField as? MenuTextField else { return MenuTextField() }
        return textField
    }
    
    // MARK - Private Methods
    private func setDefaultSettings() {
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.font = UIFont(name: "Poppins-Regular", size: 16)
        textField.autocorrectionType = .no
    }
    
    private func setAttributedText(with title: String) -> NSMutableAttributedString {
        let attributedPlaceholderText = NSMutableAttributedString(string: title)
        let requiredField = title.contains("*")
        if requiredField {
            let asteriskRange = NSRange(location: title.count - 1, length: 1)
            let asteriskAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.red]
            attributedPlaceholderText.addAttributes(asteriskAttributes, range: asteriskRange)
        }
        return attributedPlaceholderText
    }
    
    private func setKeyboardType () {
        guard let title = textField.attributedPlaceholder?.string else { return }
        var keyboardType: UIKeyboardType = .default
        if title.contains("Email") {
            keyboardType = .emailAddress
        } else if title.contains("phone") || title.contains("room") {
            keyboardType = .phonePad
        }
        textField.keyboardType = keyboardType
    }
    
    private func setSecurity() {
        let isSecure = textField.attributedPlaceholder?.string.range(of: "password", options: .caseInsensitive) != nil
        textField.isSecureTextEntry = isSecure
        textField.textContentType = .oneTimeCode
    }
    
    private func setConstraints() {
        textField.heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        textField.widthAnchor
            .constraint(equalToConstant: 320)
            .isActive = true
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
