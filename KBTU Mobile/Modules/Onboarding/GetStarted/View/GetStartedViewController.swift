//
//  GetStartedViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 15.02.2023.
//

import UIKit

final class GetStartedViewController: UIViewController, GetStartedViewInput {
    var output: GetStartedViewOutput?
    weak var coordinator: OnboardingCoordinator?

    private let welcomeLabel: UILabel = {
        let label = LabelFactory.makeBoldLabel(text: Texts.welcomeToApp, fontSize: .title)
        label.numberOfLines = 0
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logInImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let signInButton: UIButton = {
        let button = ButtonFactory.makeDefaultButton(withTitle: "Sign in with Microsoft")
        button.addTarget(nil, action: #selector(didTapSignIn), for: .touchUpInside)
        return button
    }()
    
    private let paragraphLabel: UILabel = {
        let label = LabelFactory.makeDefaultLabel(text: Texts.placeholderParagraph, fontSize: .body)
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        
        [imageView,
         welcomeLabel,
         paragraphLabel,
         signInButton].forEach {
            view.addSubview($0)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
            make.width.equalTo(300)
        }
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(8)
            make.height.width.equalTo(250)
        }
        
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(24)
        }
        
        paragraphLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(48)
            make.width.equalTo(300)
        }
    }
    
    @objc
    private func didTapSignIn() {
        output?.didTapSignIn()
    }
    
    // MARK: GetStartedViewInput methods
    func showAlert(title: String, message: String) {
        let alert = AlertFactory.getDefaultAlertController(title: title, message: message, actionTitle: Texts.ok)
        present(alert, animated: true, completion: nil)
    }
    
    func didSignIn() {
        output?.checkIfFilledProfile()
    }
    
    func moveToMain(flag: Bool) {
        if flag {
            coordinator?.moveToMain()
        } else {
            coordinator?.moveToProfileFill()
        }
    }
}
