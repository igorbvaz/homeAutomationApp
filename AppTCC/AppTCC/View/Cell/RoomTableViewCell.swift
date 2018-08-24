//
//  RoomTableViewCell.swift
//  AppTCC
//
//  Created by Igor Vaz on 23/08/18.
//  Copyright © 2018 Igor Vaz. All rights reserved.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var room: Room!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
    }
    
    func setup(room: Room) {
        self.room = room
        collectionView.reloadData()
    }

}

extension RoomTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DeviceCell", for: indexPath) as? DeviceCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(device: room.devicesArray[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return room.devicesArray.count
    }
}
