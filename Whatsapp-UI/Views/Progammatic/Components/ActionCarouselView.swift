//
//  ActionCarouselView.swift
//  Whatsapp-UI
//
//  Created by Kenay on 15/05/26.
//

import UIKit

class ActionCarouselView: UIView {
    
    let ligarBtn = RoundActionButton(iconName: "phone", title: "Ligar", accessibilityHint: "Toque duas vezes para criar uma ligação")
    let programarBtn = RoundActionButton(iconName: "calendar", title: "Programar",accessibilityHint: "Toque duas vezes para programar uma ligação" )
    let tecladoBtn = RoundActionButton(iconName: "circle.grid.3x3.fill", title: "Teclado",accessibilityHint: "Toque duas vezes para ligar para um número de telefone")
    let amoorrrBtn = RoundActionButton(iconName: "person.circle", title: "Leticia", accessibilityHint: "Toque duas vezes para ligar para Leticia")
    let favoritoBtn = RoundActionButton(iconName: "heart", title: "Favorito", accessibilityHint: "Toque duas vezes para adicionar pessoas aos favoritos")
        
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //Propriedade SafeArea garante que fique alinhado deitado e em pé 
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -16),
            

            stackView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor)
        ])
    }
    
    private func setupButtons() {
        stackView.addArrangedSubview(ligarBtn)
        stackView.addArrangedSubview(programarBtn)
        stackView.addArrangedSubview(tecladoBtn)
        stackView.addArrangedSubview(amoorrrBtn)
        stackView.addArrangedSubview(favoritoBtn)
    }
    
}
