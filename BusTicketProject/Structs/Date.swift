//
//  Date.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import Foundation

struct Date: Infoprotocol{
    
    var day: Int = 1
    var month: Int = 1
    var year: Int = 2021
    
    func giveinfo() {
       print("Gün: \(day), Ay: \(month), Yıl: \(year)")
    }
    
}
