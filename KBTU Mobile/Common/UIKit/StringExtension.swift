//
//  StringExtension.swift
//  KBTU Mobile
//
//  Created by Altynay on 05.03.2023.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@jusan.kz"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func isValidPhone() -> Bool {
        let phoneRegex1 = "^[+]{1}+[0-9]{11}$"
        let phoneRegex2 = "^[+]{1}+[0-9]{1}+[\\s]{1}+[0-9]{10}$"
        let phoneRegex3 = "^[+]{1}+[0-9]{1}+[\\s]{1}+[0-9]{3}+[\\s]{1}+[0-9]{7}$"
        let phoneRegex4 = "^[+]{1}+[0-9]{1}+[\\s]{1}+[0-9]{3}+[\\s]{1}+[0-9]{3}+[\\s]{1}+[0-9]{4}$"
        let phoneRegex5 = "^[+]{1}+[0-9]{1}+[\\s]{1}+[0-9]{3}+[\\s]{1}+[0-9]{3}+[\\s]{1}+[0-9]{2}+[\\s]{1}+[0-9]{2}$"
        let phoneTest1 = NSPredicate(format: "SELF MATCHES %@", phoneRegex1)
        let phoneTest2 = NSPredicate(format: "SELF MATCHES %@", phoneRegex2)
        let phoneTest3 = NSPredicate(format: "SELF MATCHES %@", phoneRegex3)
        let phoneTest4 = NSPredicate(format: "SELF MATCHES %@", phoneRegex4)
        let phoneTest5 = NSPredicate(format: "SELF MATCHES %@", phoneRegex5)
        
        return phoneTest1.evaluate(with: self) || phoneTest2.evaluate(with: self) || phoneTest3.evaluate(with: self) || phoneTest4.evaluate(with: self) || phoneTest5.evaluate(with: self)
    }
}

extension String {
    func localized() -> String {
        guard
            let resource = UserDefaults.standard.string(forKey: GlobalConstants.currentLanguage),
            let path = Bundle.main.path(forResource: resource, ofType: "lproj"),
            let bundle = Bundle(path: path)
        else { return "ErrorState" }
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
