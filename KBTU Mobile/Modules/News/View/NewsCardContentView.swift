//
//  NewsCardContentView.swift
//  KBTU Mobile
//
//  Created by Altynay on 02.04.2023.
//

import UIKit

final class NewsCardContentView: UIView {
    private let containerView: UIView = {
        let background = UIView()
        background.clipsToBounds = true
        background.layer.cornerRadius = 10
        return background
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = LabelFactory.makeBoldLabel(text: "", fontSize: .subtitle)
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = LabelFactory.makeDefaultLabel(text: "", fontSize: .caption)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = LabelFactory.makeDefaultLabel(text: "", fontSize: .body)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.black.withAlphaComponent(0.01).cgColor,
            UIColor.black.withAlphaComponent(0.4).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        return gradient
    }()
    
    init(withImage image: UIImage?, title: String, description: String, date: String) {
        super.init(frame: .zero)
        imageView.image = image
        titleLabel.text = title
        descriptionLabel.text = description
        dateLabel.text = date
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    private func setupUI() {
        backgroundColor = UIColor(named: GlobalConstants.lightPurple)
        addSubview(containerView)
        containerView.addSubview(imageView)
        
        [containerView, imageView].forEach { view in
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        [titleLabel, dateLabel, descriptionLabel].forEach { subview in
            containerView.addSubview(subview)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalTo(titleLabel)
            make.bottom.lessThanOrEqualTo(containerView.snp.bottom).inset(16)
        }
        
        applyShadowAndGradient()
    }
    
    private func applyShadowAndGradient() {
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.black.cgColor
        containerView.layer.insertSublayer(gradientLayer, above: imageView.layer)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let heightFactor: CGFloat = 0.35
        gradientLayer.frame = CGRect(x: 0,
                                     y: (1 - heightFactor) * bounds.height,
                                     width: bounds.width,
                                     height: heightFactor * bounds.height)
    }
}
