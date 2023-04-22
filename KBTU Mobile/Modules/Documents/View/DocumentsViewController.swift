//
//  DocumentsViewController.swift
//  KBTU Mobile
//
//  Created by Altynay on 26.02.2023.
//

import SwiftUI

class DocumentsViewController: UIHostingController<DocumentsView>, DocumentsViewInput {
    var output: DocumentsViewOutput?
    weak var coordinator: MainCoordinator?
}
