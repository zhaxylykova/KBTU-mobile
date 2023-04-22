//
//  AuthorizationViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 24.01.2023.
//

import Firebase

final class LogInViewModel {
    weak var view: LogInViewInput?
    private var networkManager: NetworkManaging?
    private var firestoreService: FirestoreServiceProtocol?
    
    init(networkManager: NetworkManaging?, firestoreService: FirestoreServiceProtocol?) {
        self.networkManager = networkManager
        self.firestoreService = firestoreService
    }
}

extension LogInViewModel: LogInViewOutput {
    func didTapLogIn() {
        networkManager?.microsoftSignIn() { [weak self] result in
            switch result {
            case .success(_):
                self?.view?.didLogIn()
            case .failure(let error):
                self?.view?.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    func checkIfFilledProfile() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        firestoreService?.getDocument(for: "users", documentID: userId, completion: { [weak self] result in
            switch result {
            case .success(_):
                self?.view?.moveToMain(flag: true)
            case .failure(_):
                self?.view?.moveToMain(flag: false)
            }
        })
    }
}
