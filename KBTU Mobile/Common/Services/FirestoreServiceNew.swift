//
//  FirestoreServiceNew.swift
//  KBTU Mobile
//
//  Created by Altynay on 21.04.2023.
//

import Firebase

protocol FirestoreServiceProtocolNew {
    func getDocuments<DataModel: Decodable>(for collection: String, completion: @escaping (Result<[DataModel], Error>) -> Void)
    func getDocument<DataModel: Decodable>(for collection: String, documentID: String, completion: @escaping (Result<DataModel, Error>) -> Void)
}

final class FirestoreServiceNew: FirestoreServiceProtocolNew {
    private let db = Firestore.firestore()
    
    func getDocuments<DataModel: Decodable>(for collection: String, completion: @escaping (Result<[DataModel], Error>) -> Void) {
        db.collection(collection).getDocuments { (querySnapshot, error) in
            if let error {
                completion(.failure(error))
                return
            }
            
            guard let querySnapshot else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get news"])
                completion(.failure(error))
                return
            }
            var dataModels = [DataModel]()
            querySnapshot.documents.forEach {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: $0.data(), options: [])
                    let dataModel = try JSONDecoder().decode(DataModel.self, from: jsonData)
                    dataModels.append(dataModel)
                } catch {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error decoding JSON: \(error)"])
                    completion(.failure(error))
                }
            }
            completion(.success(dataModels))
        }
    }
    
    func getDocument<DataModel: Decodable>(for collection: String, documentID: String, completion: @escaping (Result<DataModel, Error>) -> Void) {
        db.collection(collection).document(documentID).getDocument { (document, error) in
            if let error {
                completion(.failure(error))
                return
            }
            guard
                let document,
                let data = document.data()
            else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get document"])
                completion(.failure(error))
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                let dataModel = try JSONDecoder().decode(DataModel.self, from: jsonData)
                completion(.success(dataModel))
            } catch {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error decoding JSON: \(error)"])
                completion(.failure(error))
            }
        }
    }
}
