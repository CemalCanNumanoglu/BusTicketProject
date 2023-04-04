//
//  Time.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import Foundation

struct Time: Infoprotocol{
    
    var hour: Int = 0
    var minute: Int = 0
    
    func giveinfo() {
        print("Saat : \(hour), Dakika : \(minute)")
    }
    
}
