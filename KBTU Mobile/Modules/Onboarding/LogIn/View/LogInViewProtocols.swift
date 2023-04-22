//
//  LogInViewProtocols.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import Foundation

protocol LogInViewInput: AnyObject {
    func showAlert(title: String, message: String)
    func didLogIn()
    func moveToMain(flag: Bool)
}

protocol LogInViewOutput {
    func didTapLogIn()
    func checkIfFilledProfile()
}
