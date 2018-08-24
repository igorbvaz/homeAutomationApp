//
//  DeviceCollectionViewCell.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

class DeviceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var deviceImageView: UIImageView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var device: Device!
    var viewModel = ViewModel()
    
    func setup(device: Device) {
        self.device = device
        background.backgroundColor = device.color()
        deviceImageView.image = device.image()
        deviceNameLabel.text = device.name()
        segmentControl.selectedSegmentIndex = device.deviceStatus.rawValue
    }
    
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case DeviceStatus.on.rawValue:
            viewModel.turnDeviceOn(device: device)
            break
        case DeviceStatus.auto.rawValue:
            viewModel.turnDeviceAuto(device: device)
            break
        case DeviceStatus.off.rawValue:
            viewModel.turnDeviceOff(device: device)
            break
        default:
            break
        }
        
    }
    
}
