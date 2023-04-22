//
//  GetStartedViewProtocols.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import Foundation

protocol GetStartedViewInput: AnyObject {
    func showAlert(title: String, message: String)
    func didSignIn()
    func moveToMain(flag: Bool)
}

protocol GetStartedViewOutput {
    func didTapSignIn()
    func checkIfFilledProfile()
}
