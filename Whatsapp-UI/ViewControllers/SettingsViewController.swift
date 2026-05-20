//
//  SettingsViewController.swift
//  Whatsapp-UI
//
//  Created by Kenay on 20/05/26.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    private let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Pesquisar"
        
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            tableView.deselectRow(at: indexPath, animated: true)
            
            switch indexPath.section {
                
            case 0:
                print("Card de Perfil")
            case 1:
                let ferramentas = ["Listas", "Mensagens de transmissão", "Favoritas", "Dispositivos conectados"]
                let ferramentaClicada = ferramentas[indexPath.row]
                
                print(ferramentaClicada)
                
            default:
                break
            }
        }
    
    
    @IBAction func didTapQRcodeButton(_ sender: UIButton) {
        print("Botao do QRcode")
    }
    
}
