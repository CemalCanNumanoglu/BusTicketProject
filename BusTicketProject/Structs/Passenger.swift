//
//  Passenger.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import Foundation

struct Passenger: Infoprotocol {

    var name: String = ""
    var surname: String = ""
    var id: Int = 0

    func giveinfo() {
        print("Yolcu adı: \(name), Yolcu")
    }
}
