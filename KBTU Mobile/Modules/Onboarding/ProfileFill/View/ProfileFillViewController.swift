//
//  SignUpViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 19.02.2023.
//

import UIKit
import Firebase

final class ProfileFillViewController: UIViewController {
    var output: ProfileFillViewOutput?
    weak var coordinator: OnboardingCoordinator?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private let contentView = UIView()
    
    private let createAccountLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: "Create Account", fontSize: .title)
    }()
    
    private let signUpButton: UIButton = {
        let button = ButtonFactory.makeDefaultButton(withTitle: "Sign Up")
        button.addTarget(nil, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: termsStackView
    private let termsStackView: UIStackView = {
        StackViewFactory.makeHorizontalStackView(spacing: 4)
    }()
    
    private let readAndAgreeLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: "I have read and agree to", fontSize: .caption)
    }()
    
    private let termsAndConditionsLabel: UILabel = {
        LabelFactory.makeAttributedLabel(text: "Terms and Conditions", range: "Terms and Conditions", fontSize: .caption)
    }()
    
    // MARK: TextFields List
    private let textFieldsListStackView: UIStackView = {
        StackViewFactory.makeVerticalStackView(spacing: 30)
    }()
    
    private let firstNameTextField: UITextField = {
        TextFieldFactory().makeDefaultTextField(withTitle: "First name*")
    }()
    private let lastNameTextField: UITextField = {
        TextFieldFactory().makeDefaultTextField(withTitle: "Last name*")
    }()
    private let middleNameTextField: UITextField = {
        TextFieldFactory().makeDefaultTextField(withTitle: "Middle Name")
    }()
    private let mobilePhoneTextField: UITextField = {
        TextFieldFactory().makeDefaultTextField(withTitle: "Mobile phone*")
    }()
    private let studentIdTextField: UITextField = {
        TextFieldFactory().makeDefaultTextField(withTitle: "Student ID*")
    }()
    private let facultyTextField: UITextField = {
        let textField = TextFieldFactory().makeMenuTextField(withTitle: "Faculty*")
        textField.menuOptions = GlobalConstants.facultyList
        textField.menuHandler = { index in
            print("Selected number: \(index)")
        }
        return textField
    }()
    private let yearOfStudyTextField: UITextField = {
        let textField = TextFieldFactory().makeMenuTextField(withTitle: "Year of study*")
        textField.menuOptions = GlobalConstants.yeardOfStudy
        textField.menuHandler = { index in
            print("Selected number: \(index)")
        }
        return textField
    }()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Constraints
    private func setupUI() {
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        setupScrollView()
        setupTopLabel()
        setupTextFields()
        configureStackViews()
        setupBottomView()
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
    }
    
    private func setupTopLabel() {
        contentView.addSubview(createAccountLabel)
        createAccountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupTextFields() {
        contentView.addSubview(textFieldsListStackView)
        textFieldsListStackView.snp.makeConstraints { make in
            make.top.equalTo(createAccountLabel.snp.bottom).offset(32)
            make.horizontalEdges.equalToSuperview()
        }
        
        [firstNameTextField,
         lastNameTextField,
         middleNameTextField,
         mobilePhoneTextField,
         studentIdTextField,
         facultyTextField,
         yearOfStudyTextField
        ].forEach { textField in
            textFieldsListStackView.addArrangedSubview(textField)
            textField.delegate = self
        }
    }
    
    private func configureStackViews() {
        termsAndConditionsLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        let termsTapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTerms))
        termsAndConditionsLabel.addGestureRecognizer(termsTapGesture)
    }
    
    private func setupBottomView() {
        [readAndAgreeLabel, termsAndConditionsLabel].forEach {
            termsStackView.addArrangedSubview($0)
        }
        
        contentView.addSubview(termsStackView)
        termsStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textFieldsListStackView.snp.bottom).offset(16)
        }
        
        contentView.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(termsStackView.snp.bottom).offset(26)
            make.bottom.equalToSuperview().inset(32)
        }
    }
    
    // MARK: User Interaction
    @objc
    private func didTapTerms() {
        print("Terms and Conditions")
    }
    
    @objc
    private func signUpButtonTapped() {
        guard
            let firstName = firstNameTextField.text, !firstName.isEmpty,
            let lastName = lastNameTextField.text, !lastName.isEmpty,
            let middleName = middleNameTextField.text,
            let mobilePhone = mobilePhoneTextField.text, !mobilePhone.isEmpty,
            let studentId = studentIdTextField.text, !studentId.isEmpty,
            let faculty = facultyTextField.text, !faculty.isEmpty,
            let yearOfStudy = yearOfStudyTextField.text, !yearOfStudy.isEmpty
        else {
            showAlert(title: "Error", message: "Please fill out all required fields")
            return
        }
        
        guard mobilePhone.isValidPhone() else {
            showAlert(title: "Error", message: "Phone number is badly formatted")
            return
        }
        
        let userData = UserDataModel(firstName: firstName, lastName: lastName, middleName: middleName, phoneNumber: mobilePhone, studentId: studentId, faculty: faculty, yearOfStudy: yearOfStudy, email: Auth.auth().currentUser?.email)
        
        output?.fillUserData(data: userData)
    }
}

// MARK: - SignUpViewInput methods
extension ProfileFillViewController: ProfileFillViewInput {
    func showAlert(title: String, message: String) {
        let alert = AlertFactory.getDefaultAlertController(title: title, message: message, actionTitle: "OK")
        present(alert, animated: true, completion: nil)
    }
    
    func didSignIn() {
        coordinator?.moveToMain()
    }
}

// MARK: - TextFieldDelegate
extension ProfileFillViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case mobilePhoneTextField:
            if mobilePhoneTextField.text == "" {
                mobilePhoneTextField.text = "+7 "
            }
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case mobilePhoneTextField:
            guard let text = textField.text else { return }
            if !textField.hasText || !text.isValidPhone() {
                showAlert(title: "Error", message: "Please enter number correctly")
            }
        default:
            break
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case facultyTextField, yearOfStudyTextField:
            return false
        default:
            return true
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case studentIdTextField, mobilePhoneTextField:
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        case firstNameTextField, lastNameTextField, middleNameTextField:
            let allowedCharacters = CharacterSet.letters
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        default:
            return true
        }
    }
}
