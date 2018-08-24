//
//  Room.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

enum RoomType: Int {
    case bathroom
    case livingRoom
    case bedroom
    case kitchen
}

class Room: NSObject {
    
    var roomType: RoomType! = RoomType.bathroom
    var devicesArray = [Device]()
    
    init(roomType: RoomType) {
        self.roomType = roomType
    }
    
    func name() -> String {
        switch roomType {
        case .bathroom:
            return "Banheiro"
        default:
            return ""
        }
    }
    
}
