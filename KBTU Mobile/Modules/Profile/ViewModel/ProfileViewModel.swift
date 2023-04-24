//
//  ProfileViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import Firebase

final class ProfileViewModel: ObservableObject {
    @Published var schools: [SchoolData]?
    @Published var userData: UserDataModel?
    @Published var errorMessage: String?
    
    private var networkManager: NetworkManaging?
    private var firestoreService: FirestoreServiceProtocolNew?
    
    init(networkManager: NetworkManaging, firestoreService: FirestoreServiceProtocolNew) {
        self.networkManager = networkManager
        self.firestoreService = firestoreService
        fetchUserData()
    }
    
    func getAvatarImage() -> UIImage {
        guard
            let data = UserDefaults.standard.object(forKey: "test") as? Data,
            let image = UIImage(data: data)
        else { return UIImage(named: "backImageProfile") ?? UIImage() }
        return image
    }
    
    func fetchUserData() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        firestoreService?.getDocument(for: "users", documentID: userId, completion: { [weak self] (result: Result<UserDataModel, Error>) in
            switch result {
            case .success(let data):
                self?.userData = data
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        })
    }
    
    func updateUserData(with userData: UserDataModel?) {
        guard
            let userData,
            let userId = Auth.auth().currentUser?.uid
        else { return }
        firestoreService?.updateDocument(for: "users", documentID: userId, data: userData, completion: { result in
            self.fetchUserData()
        })
    }
    
    func logOut() {
        UserDefaults.standard.set(false, forKey: "isAuthorized")
        try? networkManager?.signOut()
    }
}
