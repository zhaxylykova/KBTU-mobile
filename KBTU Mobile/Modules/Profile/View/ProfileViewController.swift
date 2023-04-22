//
//  ProfileViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import SwiftUI

class ProfileViewController: UIHostingController<ProfileView>, ProfileViewInput {
    var output: ProfileViewOutput?
    weak var coordinator: MainCoordinator?
}
