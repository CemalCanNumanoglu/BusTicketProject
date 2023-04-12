//
//  DisplayTicketViewController.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 12.04.2023.
//

import UIKit

class DisplayTicketViewController: UIViewController {

    
    @IBOutlet var destinationLabelTxt: UILabel!
    @IBOutlet var deparatureLabelTxt: UILabel!
    @IBOutlet var nameLabelTxt: UILabel!
    @IBOutlet var surnameLabelTxt: UILabel!
    @IBOutlet var idLabelTxt: UILabel!
    @IBOutlet var dateLabelTxt: UILabel!
    @IBOutlet var timeLabelTxt: UILabel!
    @IBOutlet var seatNumLabelTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let deparature = UserDefaults.standard.string(forKey: "fromWhere") {
            deparatureLabelTxt.text = deparature
        }
        
        if let destination = UserDefaults.standard.string(forKey: "toWhere") {
            destinationLabelTxt.text = destination
        }
        
        nameLabelTxt.text = Passenger.shared.name
        surnameLabelTxt.text = Passenger.shared.surname
        idLabelTxt.text = Passenger.shared.id
        dateLabelTxt.text = Ticket.shared.date
        timeLabelTxt.text = Ticket.shared.time
        
        if let selectedSeats = UserDefaults.standard.array(forKey: "selectedSeats"){
            seatNumLabelTxt.text = "\(selectedSeats)"
        }

    }
    
    
    @IBAction func homePageBtnClicked(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let homePageVC = storyboard.instantiateViewController(withIdentifier: "homePageVC")
            homePageVC.modalPresentationStyle = .fullScreen
            self.present(homePageVC, animated: true)
        }

}
