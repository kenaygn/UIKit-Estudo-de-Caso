//
//  CallsController.swift
//  Whatsapp-UI
//
//  Created by Kenay on 14/05/26.
//

import UIKit

class CallsController: UIViewController {
    
    let tableManager = CallsTableManager()
    
    // Funciona como uma ScrollView mas tenho que adicionar as coisas como se fosse em uma tabela (header,celulas e etc...)
    private let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // Barra de pesquisa
    private let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Pesquisar"
        return search
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Ligações"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupNavigationBar()
        
        navigationItem.searchController = searchController
        // False: a barra de pesquisa fica sempre visível.
        // True: ela se esconde e só aparece se o usuário puxar a lista para baixo.
        navigationItem.hidesSearchBarWhenScrolling = true
        
        setupLayout()
        setupHeader()
    }
    
    private func setupNavigationBar() {
        
        let leftBarButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: #selector(didTapLeftBarButton)
        )
        leftBarButton.tintColor = .label
        
        leftBarButton.isAccessibilityElement = true
        leftBarButton.accessibilityLabel = "Mais"
        leftBarButton.accessibilityTraits = .button
        
        let plusImage = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold))?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let rightBarButton = UIBarButtonItem(
            image: plusImage,
            style: .prominent,
            target: self,
            action: #selector(didTapRightBarButton)
        )
        rightBarButton.tintColor = .systemGreen
        
        //Para configurar a acessibilidade do botoao com o VoiceOver
        rightBarButton.isAccessibilityElement = true
        rightBarButton.accessibilityLabel = "Nova ligação"
        rightBarButton.accessibilityHint = "Toque duas vezes para adicionar uma ligação"
        rightBarButton.accessibilityTraits = .button
        
        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.rightBarButtonItem = rightBarButton
        
    }
    
    private func setupLayout() {
        
        view.addSubview(tableView)
        
        tableView.register(CallViewCell.self, forCellReuseIdentifier: CallViewCell.identifier)
        
        tableView.dataSource = tableManager
        tableView.delegate = tableManager
        
        tableView.estimatedRowHeight = 65                                
        tableView.rowHeight = UITableView.automaticDimension
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            
        ])
        
    }
    
    private func setupHeader() {
        let headerContainer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 160))
        
        let carousel = ActionCarouselView()
        carousel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Ligações recentes"
        
        //Para fazer com que a fonte responda ao Dynamics Types
        titleLabel.font = UIFontMetrics(forTextStyle: .title2).scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .semibold), maximumPointSize: 44)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerContainer.addSubview(carousel)
        headerContainer.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            carousel.topAnchor.constraint(equalTo: headerContainer.topAnchor),
            carousel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
            carousel.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor),
            carousel.heightAnchor.constraint(equalToConstant: 110),
            
            titleLabel.topAnchor.constraint(equalTo: carousel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: headerContainer.trailingAnchor, constant: -16)
        ])
        
        tableView.tableHeaderView = headerContainer
        
        carousel.ligarBtn.circleButton.addTarget(self, action: #selector(didTapActionsButtons), for: .touchUpInside)
        carousel.amoorrrBtn.circleButton.addTarget(self, action: #selector(didTapActionsButtons), for: .touchUpInside)
        carousel.favoritoBtn.circleButton.addTarget(self, action: #selector(didTapActionsButtons), for: .touchUpInside)
        carousel.programarBtn.circleButton.addTarget(self, action: #selector(didTapActionsButtons), for: .touchUpInside)
        carousel.tecladoBtn.circleButton.addTarget(self, action: #selector(didTapActionsButtons), for: .touchUpInside)
    }
    
    
    
    
    //@objc
    @objc private func didTapLeftBarButton() {
        print("Botao esquerdo da TabBar clicado")
    }
    
    @objc private func didTapRightBarButton() {
        print("Botao direito da TabBar clicado")
    }
    
    @objc private func didTapActionsButtons() {
        print("Botao de ações do carorresel clicado")
    }
    
    
    
}
