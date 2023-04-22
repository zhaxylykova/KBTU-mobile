//
//  HomeViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import SwiftUI

class HomeViewController: UIHostingController<MenuView>, HomeViewInput {
    var output: HomeViewOutput?
    weak var coordinator: MainCoordinator?
}
