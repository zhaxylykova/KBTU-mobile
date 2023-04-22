//
//  FirebaseService.swift
//  KBTU Mobile
//
//  Created by Altynay on 19.02.2023.
//

import Firebase
import FirebaseAuth

protocol NetworkManaging {
    func microsoftSignIn(completion: @escaping (Result<AuthDataResult, Error>) -> Void)
    func fillUserData(userData: UserDataModel, completion: @escaping (Result<Void, Error>) -> Void)
    func signOut() throws
}

public final class FirebaseService: NetworkManaging {
    private let auth = Auth.auth()
    private let db = FirestoreService<NewsItemDataModel>()
    private let microsoftProvider = OAuthProvider(providerID: "microsoft.com")
    
    func microsoftSignIn(completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        microsoftProvider.getCredentialWith(_: nil) { credential, error in
            if error != nil {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get credentials"])
                completion(.failure(error))
                return
            }
            
            if let credential {
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if error != nil {
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to sign in"])
                        completion(.failure(error))
                    }
                    
                    guard
                        let authResult,
                        let email = authResult.user.email,
                        email.isValidEmail()
                    else {
                        try? self.signOut()
                        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Please log in with your KBTU email"])
                        completion(.failure(error))
                        return
                    }
                    completion(.success(authResult))
                }
            }
        }
    }
    
    func fillUserData(userData: UserDataModel, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else { return }
        guard let data = try? JSONEncoder().encode(userData) else {
            fatalError("Failed to encode person to JSON data")
        }
        guard let userDataDict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError("Failed to convert JSON data to dictionary")
        }
        db.setDocument(for: "users", documentID: user.uid, data: userDataDict, completion: completion)
    }

    func signOut() throws {
        try auth.signOut()
    }
}
