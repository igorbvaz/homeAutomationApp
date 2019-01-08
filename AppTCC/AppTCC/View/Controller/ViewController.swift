//
//  ViewController.swift
//  AppTCC
//
//  Created by Igor Vaz on 21/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit
import CoreBluetooth

// Imagem app - home

// Imagem ventilador - toys
// Imagem luz - wb_incandesce
// Imagem ar-condicionado - ac_unit

// Imagem cozinha - kitchen
// Imagem sala - weekend
// Imagem quarto - hotel
// Imagem banheiro - hot_tub

class ViewController: UIViewController {

    // MARK: Variables
    
    var device = Device(deviceType: .lightBulb, deviceStatus: .unknown)
    var viewModel = ViewModel()
    var centralManager: CBCentralManager?
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        rooms.append(Room(roomType: .livingRoom))
//        createRooms()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func createRooms() {
//        let bathroom = Room(roomType: .bathroom)
//        bathroom.devicesArray = viewModel.getDevices(room: bathroom)
//
//        let bedroom = Room(roomType: .bedroom)
//        bedroom.devicesArray = viewModel.getDevices(room: bedroom)
//
//        let kitchen = Room(roomType: .kitchen)
//        kitchen.devicesArray = viewModel.getDevices(room: kitchen)
//
//        let livingRoom = Room(roomType: .livingRoom)
//        livingRoom.devicesArray = viewModel.getDevices(room: livingRoom)
//
//        rooms = [bedroom, livingRoom, kitchen, bathroom]
//    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.roomsArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomTableViewCell else {
            return UITableViewCell()
        }
        
        
        cell.setup(room: viewModel.roomsArray[indexPath.section])
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewCell()
        
        header.contentView.tintColor = UIColor.gray
        header.contentView.backgroundColor = UIColor.white
        header.textLabel?.textColor = UIColor.gray
        
        switch section {
        case 0:
            header.imageView?.image = #imageLiteral(resourceName: "baseline_hotel_black_36pt")
            header.textLabel?.text = "Quarto"
            break
        case 1:
            header.imageView?.image = #imageLiteral(resourceName: "baseline_weekend_black_36pt")
            header.textLabel?.text = "Sala"
            break
        case 2:
            header.imageView?.image = #imageLiteral(resourceName: "baseline_kitchen_black_36pt")
            header.textLabel?.text = "Cozinha"
            break
        case 3:
            header.imageView?.image = #imageLiteral(resourceName: "baseline_hot_tub_black_36pt")
            header.textLabel?.text = "Banheiro"
            break
        default:
            break
        }
        
        return header
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
}

extension ViewController: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        print("Manager did update state")
        switch central.state {
        case .poweredOn:
            centralManager?.scanForPeripherals(withServices:nil, options: nil) // TODO: send UUID array to only discover arduinos
            Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { (tiemr: Timer) in
                self.centralManager?.stopScan()
            }
            break
        default:
            break
        }
        
        
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        viewModel.saveDevice(peripheral: peripheral)
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        
        peripheral.delegate = self
        peripheral.discoverServices(nil)
        
    }
    
}

extension ViewController: CBPeripheralDelegate {
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        print(peripheral)
        peripheral.services?.forEach({ (service: CBService) in
            print(service.isPrimary)
            peripheral.discoverCharacteristics(nil, for: service)
        })
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        service.characteristics?.forEach({ (characteristic: CBCharacteristic) in
            peripheral.writeValue("desliga".data(using: .utf8)!, for: characteristic, type: CBCharacteristicWriteType.withoutResponse)
        })
    }
    
}
