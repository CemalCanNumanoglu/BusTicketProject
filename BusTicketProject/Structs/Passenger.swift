//
//  Passenger.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import Foundation

struct Passenger: Infoprotocol {
    
    static var shared = Passenger()
    
    var name: String?
    var surname: String?
    var id: String?

    func giveinfo() {
        print("Yolcu adı: \(name), Yolcu")
    }
}
