//
//  ScholarshipsViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 14.04.2023.
//

import Foundation

final class ScholarshipsViewModel: ObservableObject {
    @Published var scholarships: [ScholarshipDataModel]?
    @Published var errorMessage: String?
    private var firestoreService: FirestoreServiceProtocol?
    
    init(firestoreService: FirestoreServiceProtocol) {
        self.firestoreService = firestoreService
        fetchScholarships()
    }
    func fetchScholarships() {
        firestoreService?.getDocuments(for: "scholarships", completion: { [weak self] (result: Result<[ScholarshipDataModel], Error>) in
            switch result {
            case .success(let data):
                self?.scholarships = data
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        })
    }
}
