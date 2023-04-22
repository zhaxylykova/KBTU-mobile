//
//  DocumentsViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import UIKit
import PDFKit

final class DocumentsViewModel: ObservableObject {
    @Published var errorMessage: String?
    @Published var pdfDocument: PDFDocument?
    @Published var documents: [DocumentDataModel]?
    
    private var firebaseStorage: FirebaseStorageServiceProtocol?
    private var firestoreService: FirestoreServiceProtocolNew?
    
    init(firebaseStorage: FirebaseStorageServiceProtocol, firestoreService: FirestoreServiceProtocolNew) {
        self.firebaseStorage = firebaseStorage
        self.firestoreService = firestoreService
        fetchHier()
    }
    
    func fetchHier() {
        firestoreService?.getDocuments(for: "documents", completion: { (result: Result<[DocumentDataModel], Error>) in
            switch result {
            case .success(let dataModel):
                self.documents = dataModel
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        })
    }
    
    func fetchDoc(path: String) {
        firebaseStorage?.fetch(path: path, completion: { result in
            switch result {
            case .success(let doc):
                DispatchQueue.main.async {
                    self.pdfDocument = doc
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        })
    }
    
    func nilPdfDoc() {
        pdfDocument = nil
    }
}
