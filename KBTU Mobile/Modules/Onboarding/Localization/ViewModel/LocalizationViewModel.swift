//
//  LocalizationViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 24.01.2023.
//

import Foundation

final class LocalizationViewModel: LocalizationViewOutput {
    weak var view: LocalizationViewInput?
    
    func didChooseLanguage(language: String) {
        UserDefaults.standard.set(language, forKey: GlobalConstants.currentLanguage)
    }
}
