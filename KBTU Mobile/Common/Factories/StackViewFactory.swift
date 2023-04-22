//
//  StackViewFactory.swift
//  KBTU Mobile
//
//  Created by Altynay on 23.02.2023.
//

import UIKit

public final class StackViewFactory {
    static func makeHorizontalStackView(spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = spacing
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }
    
    static func makeVerticalStackView(spacing: CGFloat) -> UIStackView {
        let stackView = makeHorizontalStackView(spacing: spacing)
        stackView.axis = .vertical
        return stackView
    }
}
