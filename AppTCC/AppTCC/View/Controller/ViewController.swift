//
//  ViewController.swift
//  AppTCC
//
//  Created by Igor Vaz on 21/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

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
    
    var rooms = [Room]()
    var viewModel = ViewModel()
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRooms()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createRooms() {
        let bathroom = Room(roomType: .bathroom)
        bathroom.devicesArray = viewModel.getDevices(room: bathroom)
        
        let bedroom = Room(roomType: .bedroom)
        bedroom.devicesArray = viewModel.getDevices(room: bedroom)
        
        let kitchen = Room(roomType: .kitchen)
        kitchen.devicesArray = viewModel.getDevices(room: kitchen)
        
        let livingRoom = Room(roomType: .livingRoom)
        livingRoom.devicesArray = viewModel.getDevices(room: livingRoom)
        
        rooms = [bedroom, livingRoom, kitchen, bathroom]
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RoomCell") as? RoomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setup(room: rooms[indexPath.section])
        
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
