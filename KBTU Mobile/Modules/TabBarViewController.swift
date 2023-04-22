//
//  TabBarViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = UIColor(named: GlobalConstants.purple)
        tabBar.unselectedItemTintColor = .lightGray
        view.backgroundColor = UIColor(named: GlobalConstants.backgroundColor)
        tabBar.isTranslucent = false
        navigationItem.hidesBackButton = true
    }
}
