//
//  FirestoreService.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import Firebase

protocol FirestoreServiceProtocol {
    func getDocument(for collection: String, documentID: String, completion: @escaping (Result<DocumentSnapshot, Error>) -> Void)
    func getDocuments<DataModel: FirestoreDataModel>(for collection: String, completion: @escaping (Result<[DataModel], Error>) -> Void)
}

public final class FirestoreService<DataModel: FirestoreDataModel>: FirestoreServiceProtocol {
    private let db = Firestore.firestore()
    
    // MARK: - Used Requests
    func getDocument(for collection: String, documentID: String, completion: @escaping (Result<DocumentSnapshot, Error>) -> Void) {
        db.collection(collection).document(documentID).getDocument { (document, error) in
            if let error {
                completion(.failure(error))
                return
            }
            guard
                let document,
                document.data() != nil
            else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get document"])
                completion(.failure(error))
                return
            }
            completion(.success(document))
        }
    }
    
    func getDocuments<DataModel: FirestoreDataModel>(for collection: String, completion: @escaping (Result<[DataModel], Error>) -> Void) {
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
            
            let newsItems = querySnapshot.documents.compactMap { queryDocumentSnapshot -> DataModel? in
                let newsItem = DataModel(data: queryDocumentSnapshot.data())
                return newsItem
            }
            completion(.success(newsItems))
        }
    }
    
    // MARK: - Unused Requests
    func updateDocument(for collection: String, documentID: String, data: [String: Any], completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection).document(documentID).updateData(data) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func deleteDocument(for collection: String, documentID: String, completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection).document(documentID).delete { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    
    func createDocument(for collection: String, data: [String: Any], completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection).addDocument(data: data) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func setDocument(for collection: String, documentID: String, data: [String: Any], completion: @escaping (Result<Void, Error>) -> Void) {
        db.collection(collection).document(documentID).setData(data) { error in
            if let error {
                completion(.failure(error))
                return
            }
            completion(.success(()))
        }
    }
    
}
