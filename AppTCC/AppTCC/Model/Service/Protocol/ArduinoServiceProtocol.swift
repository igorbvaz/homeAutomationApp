//
//  ArduinoServiceProtocol.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import Foundation

protocol ArduinoServiceProtocol {
    func getDevices(room: Room) -> [Device]
    func turnDeviceOn(device: Device) -> Bool
    func turnDeviceAuto(device: Device) -> Bool
    func turnDeviceOff(device: Device) -> Bool
}
