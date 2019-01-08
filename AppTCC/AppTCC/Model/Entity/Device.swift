//
//  Device.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit
import CoreBluetooth

enum DeviceType: String {
    case lightBulb = "lampada"
    case fan = "ventilador"
    case airconditioner = "arcondicionado"
    case unknown = ""
}

enum DeviceStatus: Int {
    case on = 0
    case auto = 1
    case off = 2
    case unknown = -1
}

class Device: NSObject {
    
    var deviceType: DeviceType = .unknown
    var deviceStatus: DeviceStatus = .unknown
    var bluetooth: CBPeripheral?
    
    init(deviceType: DeviceType, deviceStatus: DeviceStatus) {
        self.deviceType = deviceType
        self.deviceStatus = deviceStatus
    }
    
    func image() -> UIImage {
        switch deviceType {
        case .lightBulb:
            return #imageLiteral(resourceName: "baseline_wb_incandescent_white_48pt")
        case .fan:
            return #imageLiteral(resourceName: "baseline_toys_white_48pt")
        case .airconditioner:
            return #imageLiteral(resourceName: "baseline_ac_unit_white_48pt")
        default:
            return UIImage()
        }
    }
    
    func name() -> String {
        switch deviceType {
        case .lightBulb:
            return "Luz"
        case .fan:
            return "Ventilador"
        case .airconditioner:
            return "Ar-condicionado"
        default:
            return ""
        }
    }

    func color() -> UIColor {
        switch deviceType {
        case .lightBulb:
            return UIColor(red: 0.539, green: 0.553, blue: 0.160, alpha: 1)
        case .fan:
            return UIColor(red: 0.298, green: 0.464, blue: 0.409, alpha: 1)
        case .airconditioner:
            return UIColor(red: 0.137, green: 0.322, blue: 0.541, alpha: 1)
        default:
            return UIColor.white
        }
    }
    
    func characteristic() -> CBCharacteristic? {
        
        return self.bluetooth?.services?[0].characteristics?[0]
        
    }
    
}
