//
//  Ticket.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import Foundation

struct Ticket: Infoprotocol{
    
    var passenger: Passenger?
    var date: String?
    var time: String?
    var seat: [Int]?
    var reserved = 0
    
    func compareTickets(ticket: Ticket) -> Bool {
        if !seat!.isEmpty {
            for i in 0 ..< ticket.seat!.count {
                if seat!.contains(ticket.seat![i]){
                    return true
                }
            }
            return false
        }
        return false
    }
    
    
    func reserve(seat: Int) -> [Int] {
        if reserved > 1 {
            return self.seat!
        } else {
            let temp = repeatElement(0, count: seat)
            let tempInt = temp.map{(Int($0))}
            return tempInt
        }
    }
    
    mutating func addSeat(willReserve: Int) {
        seat!.append(willReserve)
    }
    
    
    
    func giveinfo() {
        print(passenger as Any)
        print(date as Any)
        print(time as Any)
        print(seat as Any)
    }
}
