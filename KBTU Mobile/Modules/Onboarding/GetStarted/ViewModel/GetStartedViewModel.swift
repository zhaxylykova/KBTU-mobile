//
//  GetStartedViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 15.02.2023.
//

import Firebase

final class GetStartedViewModel: GetStartedViewOutput {
    weak var view: GetStartedViewInput?
    private var networkManager: NetworkManaging?
    private var firestoreService: FirestoreServiceProtocol?
    
    init(networkManager: NetworkManaging?, firestoreService: FirestoreServiceProtocol?) {
        self.networkManager = networkManager
        self.firestoreService = firestoreService
    }
    
    func didTapSignIn() {
        networkManager?.microsoftSignIn() { [weak self] result in
            switch result {
            case .success(let user):
                self?.view?.didSignIn()
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
