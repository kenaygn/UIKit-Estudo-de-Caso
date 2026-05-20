//
//  CallModel.swift
//  Whatsapp-UI
//
//  Created by Kenay on 19/05/26.
//

import UIKit

enum CallStatus {
    case missed
    case outgoing
    case incoming
    
    var title: String {
        switch self {
        case .missed: return "Perdida"
        case .outgoing: return "Efetuada"
        case .incoming: return "Recebida"
        }
    }
    
    var iconName: String {
        switch self {
        case .missed, .incoming: return "phone.arrow.down.left.fill"
        case .outgoing: return "phone.arrow.up.right.fill"
        }
    }
    
    var isMissed: Bool {
        return self == .missed
    }
}

struct CallModel {
    let name: String
    let date: String
    let status: CallStatus
    let imageName: String?
}
