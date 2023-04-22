//
//  NewsViewProtocols.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import Foundation

protocol NewsViewInput: AnyObject {
    func startLoading()
    func stopLoading()
    func showAlert(title: String, message: String)
    func didFetchNews(news: [NewsItemDataModel])
}

protocol NewsViewOutput {
    func didAppear()
}
