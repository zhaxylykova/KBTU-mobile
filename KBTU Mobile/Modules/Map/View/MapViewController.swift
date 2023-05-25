//
//  MapViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import UIKit

final class MapViewController: UIViewController, MapViewInput {
    var output: MapViewOutput?
    weak var coordinator: MainCoordinator?
    
    // MARK: UI
    private let mapLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: "Map", fontSize: .subtitle)
    }()
    
    private let searchStackView: UIStackView = {
        StackViewFactory.makeHorizontalStackView(spacing: 16)
    }()
    
    private let searchTextField: UITextField = {
        TextFieldFactory().makeDefaultTextField(withTitle: "Enter room number")
    }()
    
    private let goButton: UIButton = {
        let button = ButtonFactory.makeDefaultButton(withTitle: "go")
        button.addTarget(nil, action: #selector(didTapGo), for: .touchUpInside)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let floorLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: " ", fontSize: .body)
    }()
    
    private let streetLabel: UILabel = {
        LabelFactory.makeDefaultLabel(text: " ", fontSize: .body)
    }()
    
    private let floorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "first_floor")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let floorNumbersStackView: UIStackView = {
        StackViewFactory.makeHorizontalStackView(spacing: 8)
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    // MARK: Private Methods
    @objc
    private func floorButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            floorImageView.image = UIImage(named: "first_floor")
        case 2:
            floorImageView.image = UIImage(named: "second_floor")
        case 3:
            floorImageView.image = UIImage(named: "third_floor")
        case 4:
            floorImageView.image = UIImage(named: "fourth_floor")
        case 5:
            floorImageView.image = UIImage(named: "fifth_floor")
        default:
            break
        }
        
        for case let button as UIButton in sender.superview?.subviews ?? [] {
            button.backgroundColor = button == sender ? UIColor(named: GlobalConstants.purple) : UIColor(named: GlobalConstants.lightPurple)
        }
    }
    
    @objc
    private func didTapGo() {
        searchTextField.resignFirstResponder()
        guard let roomNumber = searchTextField.text else { return }
        outerLoop: for streetDict in GlobalConstants.rooms.streets {
            for roomDict in streetDict.value.roomsOnFloor {
                for room in roomDict.value {
                    if room == roomNumber {
                        floorLabel.text = String(roomDict.key)
                        streetLabel.text = streetDict.key
                        guard let button = view.viewWithTag(roomDict.key) as? UIButton else { return }
                        button.sendActions(for: .touchUpInside)
                        break outerLoop
                    } else {
                        floorLabel.text = " "
                        streetLabel.text = " "
                    }
                }
            }
        }
    }
    
    // MARK: Constraints
    private func setupUI() {
        configureSearchStackView()
        configureFloorNumbersStackView()
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        
        view.addSubview(mapLabel)
        mapLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
        
        view.addSubview(searchStackView)
        searchStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mapLabel.snp.bottom).offset(48)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        view.addSubview(floorLabel)
        floorLabel.snp.makeConstraints { make in
            make.top.equalTo(searchStackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
        }
        
        view.addSubview(streetLabel)
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(floorLabel.snp.bottom).offset(4)
            make.leading.equalTo(floorLabel)
        }
        
        view.addSubview(floorImageView)
        floorImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(32)
            make.height.equalTo(floorImageView.snp.width)
            make.top.equalTo(streetLabel.snp.bottom).offset(48)
        }
        
        view.addSubview(floorNumbersStackView)
        floorNumbersStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(floorImageView.snp.bottom).offset(48)
        }
    }
    
    private func configureSearchStackView() {
        goButton.snp.makeConstraints { make in
            make.width.equalTo(65)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(200)
        }
        searchTextField.delegate = self
        
        [searchTextField, goButton].forEach { element in
            searchStackView.addArrangedSubview(element)
        }
    }
    
    private func configureFloorNumbersStackView() {
        var i = 1
        GlobalConstants.floorNumbers.forEach { floorNumber in
            let button = ButtonFactory.makeDefaultButton(withTitle: floorNumber)
            button.addTarget(self, action: #selector(floorButtonTapped(_:)), for: .touchUpInside)
            button.setTitleColor(.white, for: .normal)
            button.tag = i
            i += 1
            button.snp.makeConstraints { make in
                make.width.height.equalTo(40)
            }
            floorNumbersStackView.addArrangedSubview(button)
        }
    }
}

extension MapViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
}
