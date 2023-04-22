//
//  SignUpViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 19.02.2023.
//

import Foundation

class ProfileFillViewModel: ProfileFillViewOutput {
    weak var view: ProfileFillViewInput?
    private var networkManager: NetworkManaging?
    
    init(networkManager: NetworkManaging?) {
        self.networkManager = networkManager
    }
    
    func fillUserData(data: UserDataModel) {
        networkManager?.fillUserData(userData: data) { [weak self] result in
            switch result {
            case .success():
                self?.view?.didSignIn()
            case .failure(let error):
                self?.view?.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
