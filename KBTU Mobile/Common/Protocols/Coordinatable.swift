//
//  Coordinating.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import UIKit

protocol Coordinatable: AnyObject {
    var navController: UINavigationController { get set }

    func start()
}
