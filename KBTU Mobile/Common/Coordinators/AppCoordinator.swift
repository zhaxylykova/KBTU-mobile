//
//  MainCoordinator.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import UIKit

fileprivate enum LaunchInstructor {
    case main
    case onboarding
}

final class AppCoordinator: BaseCoordinator, Coordinatable {
    var navController: UINavigationController
    
    private var instructor: LaunchInstructor {
        let isAuthorized = UserDefaults.standard.bool(forKey: "isAuthorized")
        if isAuthorized {
            return .main
        } else {
            return .onboarding
        }
    }
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        switch instructor {
        case .onboarding: runOnboardingFlow()
        case .main: runMainFlow()
        }
    }
    
    func runOnboardingFlow() {
        let onboardingCoordinator = OnboardingCoordinator(navController: navController)
        onboardingCoordinator.finishFlow = { [unowned self, unowned onboardingCoordinator] in
            UserDefaults.standard.set(true, forKey: "onboardingWasShown")
            UserDefaults.standard.set(true, forKey: "isAuthorized")
            self.removeDependency(onboardingCoordinator)
            self.start()
        }
        addDependency(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func runMainFlow() {
        let mainCoordinator = MainCoordinator(navController: navController)
        mainCoordinator.finishFlow = { [unowned self, unowned mainCoordinator] in
            self.removeDependency(mainCoordinator)
            self.start()
        }
        addDependency(mainCoordinator)
        mainCoordinator.start()
    }
}
