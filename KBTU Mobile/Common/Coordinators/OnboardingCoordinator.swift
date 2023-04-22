//
//  OnboardingCoordinator.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import UIKit

typealias CompletionBlock = () -> Void

protocol OnboardingCoordinatorOutput: AnyObject {
    var finishFlow: CompletionBlock? { get set }
}

final class OnboardingCoordinator: BaseCoordinator, Coordinatable, OnboardingCoordinatorOutput {
    var finishFlow: CompletionBlock?
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        if UserDefaults.standard.bool(forKey: "onboardingWasShown") {
            moveToLogIn()
        } else {
            moveToLocalization()
        }
    }
    
    func moveToLocalization() {
        let viewController = LocalizationViewController()
        let viewModel = LocalizationViewModel()
        viewController.output = viewModel
        viewController.coordinator = self
        viewModel.view = viewController
        navController.pushViewController(viewController, animated: true)
    }
    
    func moveToGetStarted() {
        let viewController = GetStartedViewController()
        let viewModel = GetStartedViewModel(networkManager: FirebaseService(), firestoreService: FirestoreService<NewsItemDataModel>())
        viewController.output = viewModel
        viewController.coordinator = self
        viewModel.view = viewController
        navController.pushViewController(viewController, animated: true)
    }
    
    func moveToProfileFill() {
        let viewController = ProfileFillViewController()
        let networkManager: NetworkManaging = FirebaseService()
        let viewModel = ProfileFillViewModel(networkManager: networkManager)
        viewController.output = viewModel
        viewController.coordinator = self
        viewModel.view = viewController
        navController.pushViewController(viewController, animated: true)
    }
    
    func moveToLogIn() {
        let viewController = LogInViewController()
        let networkManager: NetworkManaging = FirebaseService()
        let viewModel = LogInViewModel(networkManager: networkManager, firestoreService: FirestoreService<NewsItemDataModel>())
        viewController.output = viewModel
        viewController.coordinator = self
        viewModel.view = viewController
        navController.pushViewController(viewController, animated: true)
    }
    
    func moveToMain() {
        finishFlow?()
    }
}
