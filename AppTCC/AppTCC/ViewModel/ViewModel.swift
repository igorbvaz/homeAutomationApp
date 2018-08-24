//
//  ViewModel.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

class ViewModel {
    
    var service: ArduinoServiceProtocol = ArduinoService()
    
    func getDevices(room: Room) -> [Device] {
        
        return service.getDevices(room: room)
        
    }
    
    func turnDeviceOn(device: Device) {
        service.turnDeviceOn(device: device)
    }
    
    func turnDeviceAuto(device: Device) {
        service.turnDeviceAuto(device: device)
    }
    
    func turnDeviceOff(device: Device) {
        service.turnDeviceOff(device: device)
    }
    
}
