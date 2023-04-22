//
//  AuthorizationViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 24.01.2023.
//

import UIKit

class LogInViewController: UIViewController {
    var output: LogInViewOutput?
    weak var coordinator: OnboardingCoordinator?
    
    // MARK: UI Elements
    private let welcomeLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: Texts.welcomeBack, fontSize: .title)
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logInImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let logInButton: UIButton = {
        let button = ButtonFactory.makeDefaultButton(withTitle: "Sign in with Microsoft")
        button.addTarget(nil, action: #selector(didTapLogIn), for: .touchUpInside)
        return button
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: User Interaction
    @objc
    private func didTapLogIn() {
        output?.didTapLogIn()
    }
    
    // MARK: Constraints
    private func setupUI() {
        navigationItem.hidesBackButton = true
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        view.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(175)
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp_bottomMargin).offset(16)
            make.height.width.equalTo(250)
        }
        
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp_bottomMargin).offset(48)
        }
    }
}

// MARK: - SignUpViewInput methods
extension LogInViewController: LogInViewInput {
    func showAlert(title: String, message: String) {
        let alert = AlertFactory.getDefaultAlertController(title: title, message: message, actionTitle: Texts.ok)
        present(alert, animated: true, completion: nil)
    }
    
    func didLogIn() {
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
