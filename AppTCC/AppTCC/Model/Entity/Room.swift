//
//  Room.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

enum RoomType: String {
    case bathroom = "banheiro"
    case livingRoom = "sala"
    case bedroom = "quarto"
    case kitchen = "cozinha"
}

class Room: NSObject {
    
    var roomType: RoomType? = RoomType.bathroom
    var devicesArray = [Device]()
    
    init(roomType: RoomType) {
        self.roomType = roomType
    }
    
    func name() -> String {
        guard let roomType = roomType else {
            return "Desconhecido"
        }
        
        switch roomType {
        case .bathroom:
            return "Banheiro"
        default:
            return ""
        }
    }
    
}
