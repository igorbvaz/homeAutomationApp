//
//  ViewModel.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewModel {
    
    var service: ArduinoServiceProtocol = ArduinoService()
    var arduinos = [CBPeripheral]()
    var roomsArray = [Room]()
    
    func getDevices(room: Room) -> [Device] {
        
        return service.getDevices(room: room)
        
    }
    
    func turnDeviceOn(device: Device) {
        
        guard let characteristic = device.characteristic() else {
            return
        }
        
        device.bluetooth?.writeValue("liga".data(using: .utf8)!, for: characteristic, type: .withoutResponse)
//        service.turnDeviceOn(device: device)
    }
    
    func turnDeviceAuto(device: Device) {
        service.turnDeviceAuto(device: device)
    }
    
    func turnDeviceOff(device: Device) {
        guard let characteristic = device.characteristic() else {
            return
        }
        device.bluetooth?.writeValue("desliga".data(using: .utf8)!, for: characteristic, type: .withoutResponse)
//        service.turnDeviceOff(device: device)
    }
    
    func saveDevice(peripheral: CBPeripheral) {
        
        if peripheral.name == "HMSoft" {
            // TODO: Use peripheral name
            var name: String?
            name = "HMSoft-Banheiro-Lampada"
            if let info = /*peripheral.name?*/name?.components(separatedBy: "-"), info.count >= 2 {
                
                let roomTypeRaw = info[1]
                if let roomType = RoomType(rawValue: roomTypeRaw) {
                    let room = Room(roomType: roomType)
                    var isNewRoom = true
                    roomsArray.forEach { (aRoom: Room) in
                        if aRoom.name() == room.name() {
                            isNewRoom = false
                        }
                    }
                    if isNewRoom {
                        roomsArray.append(room)
                    }
                }
                
                
            }
            
//            device.bluetooth = peripheral
//            viewModel.arduinos.append(peripheral)
            //            centralManager?.connect(viewModel.arduinos[0], options: nil)
        }
        
    }
    
}
