//
//  FirebaseStorageService.swift
//  KBTU Mobile
//
//  Created by Altynay on 14.04.2023.
//

import FirebaseStorage
import PDFKit

protocol FirebaseStorageServiceProtocol {
    func fetch(path: String, completion: @escaping (Result<PDFDocument, Error>) -> ())
}


final class FirebaseStorageService: FirebaseStorageServiceProtocol {
    
    func fetch(path: String, completion: @escaping (Result<PDFDocument, Error>) -> ()) {
        let storageRef = Storage.storage().reference(withPath: path)
        storageRef.downloadURL { url, error in
            guard error == nil else {
//                completion(error)
                return
            }
            guard let url else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get url"])
                completion(.failure(error))
                return
            }
            
            let task = URLSession.shared.downloadTask(with: url) { (localURL, _, error) in
                guard error == nil else {
//                    completion(.failure(error))
                    return
                }
                
                if let localURL = localURL {
                    if let pdfDocument = PDFDocument(url: localURL) {
                        completion(.success(pdfDocument))
                    } else {
                        print("Error loading PDF file")
                    }
                } else if let error = error {
                    print("Error downloading PDF: \(error)")
                }
            }
            task.resume()
        }
    }
    
}
