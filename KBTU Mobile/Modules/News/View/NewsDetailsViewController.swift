//
//  NewsDetailsViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 09.04.2023.
//

import UIKit

final class NewsDetailsViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        LabelFactory.makeBoldLabel(text: "", fontSize: .subtitle)
    }()
    
    private let dateLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: "", fontSize: .caption)
    }()
    
    private let descriptionLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: "", fontSize: .body)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        setupUI()
    }
    
    func set(title: String, description: String, date: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
    }
    
    private func setupUI() {
        [titleLabel, dateLabel, descriptionLabel].forEach { subview in
            subview.numberOfLines = 0
            view.addSubview(subview)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.horizontalEdges.equalToSuperview().inset(32)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(48)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(titleLabel)
        }
    }
    
}
