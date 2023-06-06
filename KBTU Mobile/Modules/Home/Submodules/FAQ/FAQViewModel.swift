//
//  FAQViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 06.06.2023.
//

import Foundation

final class FAQViewModel: ObservableObject {
    @Published var items: [FAQDataModel]?
    @Published var errorMessage: String?
    private var firestoreService: FirestoreServiceProtocolNew?
    
    init(firestoreService: FirestoreServiceProtocolNew) {
        self.firestoreService = firestoreService
        fetchFAQ()
    }
    
    func fetchFAQ() {
        firestoreService?.getDocuments(for: "faq", completion: { (result: Result<[FAQDataModel], Error>) in
            switch result {
            case .success(let dataModel):
                self.items = dataModel
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        })
    }
}
