//
//  KbtuFacesViewModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 24.04.2023.
//

import Foundation

class KbtuFacesViewModel: ObservableObject {
    @Published var kbtufaces: [KbtuFacesDataModel]?
    @Published var errorMessage: String?
    private var firestoreService: FirestoreServiceProtocolNew?
    
    init(firestoreService: FirestoreServiceProtocolNew) {
        self.firestoreService = firestoreService
    }
    func fetchKbtuFaces() {
        firestoreService?.getDocuments(for: "kbtufaces", completion: { [weak self] (result: Result<[KbtuFacesDataModel], Error>) in
            switch result {
            case .success(let data):
                self?.kbtufaces = data
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        })
    }
}
