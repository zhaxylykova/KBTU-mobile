//
//  NewsViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import UIKit
import Shuffle_iOS

final class NewsViewController: UIViewController {
    var output: NewsViewOutput?
    weak var coordinator: MainCoordinator?
    var news = [NewsItemDataModel]() {
        didSet {
            filteredNews = news
        }
    }
    var filteredNews: [NewsItemDataModel] = [] {
        didSet {
            cardStack.reloadData()
        }
    }
    
    // MARK: UI
    private let loader = UIActivityIndicatorView()
    
    private let newsLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: "News", fontSize: .subtitle)
    }()
    
    private lazy var searchTextField: UITextField = {
        let textField = TextFieldFactory().makeDefaultTextField(withTitle: "Enter keywords...")
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .none
        textField.delegate = self
        return textField
    }()
    private lazy var cardStack: SwipeCardStack = {
        let cardStack = SwipeCardStack()
        cardStack.delegate = self
        cardStack.dataSource = self
        return cardStack
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.didAppear()
    }
    
    // MARK: Private methods
    private func addLeftSwipeGesture() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft(_:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
    }
    
    @objc
    private func handleSwipeLeft(_ gestureRecognizer: UISwipeGestureRecognizer) {
        cardStack.undoLastSwipe(animated: true)
    }
    
    // MARK: Constraints
    private func setupUI() {
        addLeftSwipeGesture()
        
        [loader, newsLabel, searchTextField, cardStack].forEach { subview in
            view.addSubview(subview)
        }
        
        newsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(newsLabel.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        cardStack.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(80)
        }
        
        loader.snp.makeConstraints { make in
            make.center.equalTo(cardStack)
        }
    }
}

// MARK: - NewsViewInput methods
extension NewsViewController: NewsViewInput {
    func startLoading() {
        loader.startAnimating()
    }
    
    func stopLoading() {
        loader.stopAnimating()
    }
    
    func showAlert(title: String, message: String) {
        let alert = AlertFactory.getDefaultAlertController(title: title, message: message, actionTitle: "OK") { [weak self] in
            if title == "Success" {
                self?.coordinator?.start()
            }
        }
        present(alert, animated: true, completion: nil)
    }
    
    func didFetchNews(news: [NewsItemDataModel]) {
        self.news = news
    }
}

// MARK: - SwipeCard methods
extension NewsViewController: SwipeCardStackDataSource, SwipeCardStackDelegate {
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
        let model = filteredNews[index]
        card.swipeDirections = [.right]
        card.content = NewsCardContentView(withImage: model.image, title: model.title, description: model.description, date: model.date)
        return card
    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return filteredNews.count
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        searchTextField.resignFirstResponder()
        let title = filteredNews[index].title
        let description = filteredNews[index].description
        let date = filteredNews[index].date
        let vc = NewsDetailsViewController()
        vc.set(title: title, description: description, date: date)
        present(vc, animated: true)
    }
}

// MARK: - TextField methods
extension NewsViewController: UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        filteredNews = news
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if searchText.isEmpty {
            filteredNews = news
            return true
        }
        var filteredModels = [NewsItemDataModel]()
        news.forEach { model in
            if
                model.title.range(of: searchText, options: .caseInsensitive) != nil ||
                model.description.range(of: searchText, options: .caseInsensitive) != nil
            {
                filteredModels.append(model)
            }
        }
        
        filteredNews = filteredModels
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
}
