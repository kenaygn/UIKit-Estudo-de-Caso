//
//  CallsTableManager.swift
//  Whatsapp-UI
//
//  Created by Kenay on 19/05/26.
//

import UIKit

import UIKit

class CallsTableManager: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private let calls: [CallModel] = [
        CallModel(name: "Daddy", date: "14:00", status: .missed, imageName: "daddy"),
        CallModel(name: "Jenny ", date: "15/10/26", status: .outgoing, imageName: "jenny"),
        CallModel(name: "Julio", date: "Segunda-feira", status: .incoming, imageName: nil),
        CallModel(name: "Chefe", date: "Domingo", status: .missed, imageName: "emmett"),
        CallModel(name: "Desconhecido", date: "Ontem", status: .incoming, imageName: nil)
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CallViewCell.identifier, for: indexPath) as? CallViewCell else {
            return UITableViewCell()
        }
        
        let call = calls[indexPath.row]
        
        cell.configure(model: call)
        cell.didTapInfoButton = {
            print("Botao de info do \(call.name) clicado")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    //Acao de quando a celula for clicada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //Para descobrir qual a celula que foi clicada usa o indexPath.row
        let call = calls[indexPath.row]
        print("Ligação iniciada para \(call.name)")
    }
    
}
