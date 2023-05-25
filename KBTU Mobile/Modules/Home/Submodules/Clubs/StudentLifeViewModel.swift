//
//  StudentLifeViewModel.swift
//  KBTU Mobile
//
//  Created by Karina Abubakirova on 24.05.2023.
//

import SwiftUI

class StudentLifeViewModel: ObservableObject {
        @Published var studentlife: [KbtuFacesDataModel]?
        @Published var errorMessage: String?
        private var firestoreService: FirestoreServiceProtocolNew?
        
        init(firestoreService: FirestoreServiceProtocolNew) {
            self.firestoreService = firestoreService
        }
        func fetchStudentLife() {
            firestoreService?.getDocuments(for: "studentlife", completion: { [weak self] (result: Result<[KbtuFacesDataModel], Error>) in
                switch result {
                case .success(let data):
                    self?.studentlife = data
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            })
        }
    }
