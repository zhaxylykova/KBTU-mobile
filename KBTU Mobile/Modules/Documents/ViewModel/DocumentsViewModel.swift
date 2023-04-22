//
//  DocumentsViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import UIKit
import PDFKit

final class DocumentsViewModel: ObservableObject {
    @Published var schools: [SchoolData]?
    @Published var userData: UserDataModel?
    @Published var errorMessage: String?
    @Published var pdfDocument: PDFDocument?
    
    
    let vc = UIViewController()
    var pdfView = PDFView()
    
    private var firebaseStorage: FirebaseStorageServiceProtocol?
    
    init(firebaseStorage: FirebaseStorageServiceProtocol) {
        self.firebaseStorage = firebaseStorage
        
        
        pdfView = PDFView(frame: vc.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.view.addSubview(pdfView)

        fetchDoc()
    }
    
    private func fetchDoc() {
        firebaseStorage?.fetch(path: "КЭД ФИТ 2020-2021.pdf", completion: { result in
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
    
}
