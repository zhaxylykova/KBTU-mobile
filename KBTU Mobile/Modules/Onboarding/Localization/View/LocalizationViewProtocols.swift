//
//  LocalizationViewProtocols.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import Foundation

protocol LocalizationViewInput: AnyObject {
    
}

protocol LocalizationViewOutput {
    func didChooseLanguage(language: String)
}
