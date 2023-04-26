//
//  MobilityViewModel.swift
//  KBTU Mobile
//
//  Created by Olzhas Seilkhanov on 26.04.2023.
//

import SwiftUI

final class MobilityViewModel: ObservableObject {
    @Published var mobilityData: [CarouselItemDataModel]?
    @Published var errorMessage: String?
    private var firestoreService: FirestoreServiceNew?
    
    init(firestoreService: FirestoreServiceNew?) {
        self.firestoreService = firestoreService
        fetchMobilityData()
    }
    
    private func fetchMobilityData() {
        firestoreService?.getDocuments(for: "mobility", completion: { [weak self] (result: Result<[CarouselItemDataModel], Error>) in
            switch result {
            case .success(let data):
                self?.mobilityData = data
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        })
    }
}
