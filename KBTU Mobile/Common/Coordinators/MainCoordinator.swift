//
//  MainCoordinator.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import UIKit

protocol MainCoordinatorOutput: AnyObject {
    var finishFlow: CompletionBlock? { get set }
}

final class MainCoordinator: BaseCoordinator, Coordinatable, ObservableObject, MainCoordinatorOutput {
    var finishFlow: CompletionBlock?
    var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let homeViewController = HomeViewController(rootView: MenuView())
        homeViewController.coordinator = self
//        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: nil)
        
        // News
        let newsViewController = NewsViewController()
        let firestoreService = FirestoreService<NewsItemDataModel>()
        let newsViewModel = NewsViewModel(firestoreService: firestoreService)
        newsViewController.output = newsViewModel
        newsViewModel.view = newsViewController
        newsViewController.coordinator = self
        let newsNavigationController = UINavigationController(rootViewController: newsViewController)
        newsNavigationController.tabBarItem = UITabBarItem(title: "News", image: UIImage(systemName: "newspaper"), selectedImage: nil)

        // Map
        let mapViewController = MapViewController()
        mapViewController.coordinator = self
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), selectedImage: nil)

        
        // Documents
        let documentsViewController = DocumentsViewController(rootView: DocumentsView())
        documentsViewController.coordinator = self
        let documentsNavigationController = UINavigationController(rootViewController: documentsViewController)
        documentsNavigationController.tabBarItem = UITabBarItem(title: "Documents", image: UIImage(systemName: "doc"), selectedImage: nil)

        // Profile
        let profileView = ProfileView(coordinator: self)
        let profileViewController = ProfileViewController(rootView: profileView)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: nil)
        
        let tabBarController = TabBarViewController()
        tabBarController.viewControllers = [
            homeViewController,
            newsNavigationController,
            mapNavigationController,
            documentsNavigationController,
            profileNavigationController
        ]

        navController.pushViewController(tabBarController, animated: true)
    }
    
    func moveToAuth() {
        finishFlow?()
    }
}
