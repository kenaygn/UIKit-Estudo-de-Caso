//
//  CallViewCell.swift
//  Whatsapp-UI
//
//  Created by Kenay on 19/05/26.
//

import UIKit

class CallViewCell: UITableViewCell {
    
    static let identifier = "CallViewCell"
    
    var didTapInfoButton: (() -> Void)?
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .title3).scaledFont(for: UIFont.systemFont(ofSize: 16, weight: .semibold))
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let callTypeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        // Usamos os SF Symbols nativos da Apple
        let config = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular)
        imageView.image = UIImage(systemName: "phone.arrow.up.right.fill", withConfiguration: config)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let callTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .regular))
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: UIFont.systemFont(ofSize: 14, weight: .regular))
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .light)
        button.setImage(UIImage(systemName: "info.circle", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //Stacks
    
    private let callTypeStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let textContentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
        infoButton.addTarget(self, action: #selector(objcDidTapInfoButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) { fatalError("init") }
    
    
    private func setupView() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(textContentStackView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(infoButton)
        
        
        // Montamos as Stacks
        callTypeStackView.addArrangedSubview(callTypeIcon)
        callTypeStackView.addArrangedSubview(callTypeLabel)
        
        textContentStackView.addArrangedSubview(nameLabel)
        textContentStackView.addArrangedSubview(callTypeStackView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 48),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            
            infoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoButton.widthAnchor.constraint(equalToConstant: 24),
            infoButton.heightAnchor.constraint(equalToConstant: 24),
            
            dateLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -12),
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            textContentStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 12),
            textContentStackView.trailingAnchor.constraint(lessThanOrEqualTo: dateLabel.leadingAnchor, constant: -8),
            textContentStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(model: CallModel) {
        nameLabel.text = model.name
        dateLabel.text = model.date
        callTypeLabel.text = model.status.title
        
        if let imageName = model.imageName {
            profileImageView.image = UIImage(named: imageName)
            profileImageView.contentMode = .scaleAspectFill
        } 
        
        let config = UIImage.SymbolConfiguration(pointSize: 12, weight: .regular)
        callTypeIcon.image = UIImage(systemName: model.status.iconName, withConfiguration: config)
        
        if model.status.isMissed {
            nameLabel.textColor = .systemRed
        } else {
            nameLabel.textColor = .label
        }
        
        self.isAccessibilityElement = true
        self.accessibilityLabel = "\(model.name). Chamada \(model.status.title)."
        self.accessibilityValue = model.date
        self.accessibilityHint = "Toque duas vezes para iniciar a chamada."
    }
    
    
    
    @objc private func objcDidTapInfoButton() {
        didTapInfoButton?()
    }
    
}
