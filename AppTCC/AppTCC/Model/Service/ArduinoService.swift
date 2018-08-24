//
//  ArduinoService.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import Foundation

class ArduinoService: ArduinoServiceProtocol {
    func turnDeviceOn(device: Device) -> Bool {
        // mock
        return true
    }
    
    func turnDeviceAuto(device: Device) -> Bool {
        // mock
        return true
    }
    
    func turnDeviceOff(device: Device) -> Bool {
        // mock
        return true
    }
    
    func getDevices(room: Room) -> [Device] {
        // mock
        var devices = [Device]()
        
        switch room.roomType {
        case .bathroom:
            devices.append(Device(deviceType: .lightBulb, deviceStatus: .off))
            break
        case .bedroom:
            devices.append(Device(deviceType: .lightBulb, deviceStatus: .off))
            devices.append(Device(deviceType: .fan, deviceStatus: .off))
            devices.append(Device(deviceType: .airconditioner, deviceStatus: .on))
            break
        case .livingRoom:
            devices.append(Device(deviceType: .lightBulb, deviceStatus: .off))
            devices.append(Device(deviceType: .fan, deviceStatus: .off))
            break
        case .kitchen:
            devices.append(Device(deviceType: .lightBulb, deviceStatus: .off))
            devices.append(Device(deviceType: .lightBulb, deviceStatus: .off))
            break
        default:
            break
        }
        
        return devices
    }
}
