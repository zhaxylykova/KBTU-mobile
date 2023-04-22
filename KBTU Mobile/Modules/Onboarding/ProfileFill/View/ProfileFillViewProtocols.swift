//
//  ProfileFillViewProtocols.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import Foundation

protocol ProfileFillViewInput: AnyObject {
    func showAlert(title: String, message: String)
    func didSignIn()
}

protocol ProfileFillViewOutput {
    func fillUserData(data: UserDataModel)
}
