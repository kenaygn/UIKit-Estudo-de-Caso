//
//  RoundActionButton.swift
//  Whatsapp-UI
//
//  Created by Kenay on 15/05/26.
//

import UIKit

class RoundActionButton: UIView {
    
    let circleButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .systemGray6
        config.baseForegroundColor = .label
        config.cornerStyle = .capsule
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        //Para que passe a aceitar o dynamic types
        label.font = UIFontMetrics(forTextStyle: .subheadline).scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .regular), maximumPointSize: 44)
        label.adjustsFontForContentSizeCategory = true
       
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    init(iconName: String, title: String, accessibilityHint: String) {
        super.init(frame: .zero)
        
        let iconConfig = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        circleButton.setImage(UIImage(systemName: iconName, withConfiguration: iconConfig), for: .normal)
        
        titleLabel.text = title
        //Desabilitar do title ja que a pessoa vai clicar no botao em si
        titleLabel.isAccessibilityElement = false
        
        //Mostramos que esse botao é um elemento com Acessibilidade
        circleButton.isAccessibilityElement = true
        //Colocamos o que vai ser lido pelo VoiceOver quando esse botao for clicado
        circleButton.accessibilityLabel = title
        //Indicar qual a acao esse botao realiza
        circleButton.accessibilityHint = accessibilityHint
        //Indicamos que tipo de componente é esse.
        circleButton.accessibilityTraits = .button
        
        setupView()
    }
    
    required init?(coder: NSCoder) { fatalError("init") }
        
    private func setupView() {
        addSubview(circleButton)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 76),
            
            circleButton.topAnchor.constraint(equalTo: topAnchor),
            circleButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleButton.widthAnchor.constraint(equalToConstant: 56),
            circleButton.heightAnchor.constraint(equalToConstant: 56),
            
            titleLabel.topAnchor.constraint(equalTo: circleButton.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
