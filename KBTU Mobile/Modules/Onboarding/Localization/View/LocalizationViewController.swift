//
//  ViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 24.01.2023.
//

import UIKit
import SnapKit

final class LocalizationViewController: UIViewController, LocalizationViewInput {
    var output: LocalizationViewOutput?
    weak var coordinator: OnboardingCoordinator?
    
    private let selectLanguageLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Language"
        label.font = UIFont(name: "Poppins-Bold", size: 24)!
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        return stackView
    }()
    
    private let bottomImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "personImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let buttonTitles = ["English": "en", "Қазақша": "kk", "Русский": "ru"]
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: User Interaction
    @objc
    private func buttonTapped(_ sender: UIButton) {
        guard let key = sender.currentTitle, let language = buttonTitles[key] else { return }
        output?.didChooseLanguage(language: language)
        coordinator?.moveToGetStarted()
    }
    
    // MARK: Constraints
    private func setupUI() {
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        
        // buttons
        view.addSubview(buttonStackView)
        buttonStackView.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
        buttonTitles.forEach {
            let button = ButtonFactory.makeDefaultButton(withTitle: $0.key)
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttonStackView.addArrangedSubview(button)
        }
        
        // top label
        view.addSubview(selectLanguageLabel)
        selectLanguageLabel.snp.makeConstraints { make in
            make.bottom.equalTo(buttonStackView.snp_topMargin).offset(-35)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
        }
        
        // bottom image
        view.addSubview(bottomImageView)
        bottomImageView.snp.makeConstraints { make in
            make.height.equalTo(bottomImageView.snp.width).multipliedBy(1.2)
            make.horizontalEdges.equalTo(view).inset(30)
            make.bottom.equalTo(view)
        }
    }
}
