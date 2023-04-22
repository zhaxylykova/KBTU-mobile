//
//  SchoolsViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 21.04.2023.
//

import Foundation

final class StudentGuideViewModel: ObservableObject {
    @Published var schools: [SchoolData]?
    @Published var errorMessage: String?
    private var firestoreService: FirestoreServiceProtocolNew?
    
    init(firestoreService: FirestoreServiceProtocolNew) {
        self.firestoreService = firestoreService
        fetchSchools()
    }
    
    func fetchSchools() {
        firestoreService?.getDocuments(for: "studentguide", completion: { [weak self] (result: Result<[SchoolData], Error>) in
            switch result {
            case .success(let data):
                self?.schools = data
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        })
    }
}
