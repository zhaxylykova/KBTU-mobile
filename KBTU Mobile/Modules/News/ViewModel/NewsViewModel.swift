//
//  NewsViewModel.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import Foundation

final class NewsViewModel: NewsViewOutput {
    weak var view: NewsViewInput?
    private let firestoreService: FirestoreServiceProtocol
    
    init(firestoreService: FirestoreServiceProtocol) {
        self.firestoreService = firestoreService
    }
    
    func didAppear() {
        view?.startLoading()
        firestoreService.getDocuments(for: "news") { [weak self] (result: Result<[NewsItemDataModel], Error>) in
            self?.view?.stopLoading()
            switch result {
            case .success(let news):
                self?.view?.didFetchNews(news: news)
            case .failure(let error):
                self?.view?.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
}
