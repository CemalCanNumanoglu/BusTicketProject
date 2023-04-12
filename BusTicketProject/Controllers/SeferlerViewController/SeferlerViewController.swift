//
//  SeferlerViewController.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 9.04.2023.
//

import UIKit

class SeferlerViewController: UIViewController {
    
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - PROPERTIES
    var deparature: String?
    var destination: String?
    var seferler = [SeferModel]()
    var price: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        seferler.append(SeferModel(companyName: "METRO TURİZM", companyImage: "metro", price: 300, deparaturePoint: deparature!, destinationPoint: destination!, time: "02:00"))
        seferler.append(SeferModel(companyName: "ULUSOY", companyImage: "ulusoy", price: 320, deparaturePoint: deparature!, destinationPoint: destination!, time: "04:00"))
        seferler.append(SeferModel(companyName: "KAMİL KOÇ", companyImage: "kamilkoc", price: 300, deparaturePoint: deparature!, destinationPoint: destination!, time: "08:00"))
        seferler.append(SeferModel(companyName: "LÜKS ARTVİN", companyImage: "luksartvin", price: 310, deparaturePoint: deparature!, destinationPoint: destination!, time: "12:00"))
        seferler.append(SeferModel(companyName: "CESUR BİNGÖL", companyImage: "cesurbingol", price: 290, deparaturePoint: deparature!, destinationPoint: destination!, time: "14:00"))
        seferler.append(SeferModel(companyName: "VARAN TURİZM", companyImage: "varan", price: 290, deparaturePoint: deparature!, destinationPoint: destination!, time: "20:00"))

       
        self.tableView.register(UINib(nibName: "SeferCell", bundle: nil), forCellReuseIdentifier: "seferCell")
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSeatVC" {
            let destinationVC = segue.destination as? SeatViewController
            destinationVC?.price = price
        }
    }

   
}

//MARK: - EXTENSION
extension SeferlerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        seferler.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seferCell") as! SeferCell
        
        cell.configure(model: seferler[indexPath.section])
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 2
        cell.layoutMargins = UIEdgeInsets(top: 0, left: 30, bottom: 10, right: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        self.tableView.estimatedRowHeight = 150
        return UITableView.automaticDimension
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toSeatVC", sender: self)
        price = seferler[indexPath.section].price
        UserDefaults.standard.set(price, forKey: "price")
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellSpacingHeight: CGFloat = 10
        return cellSpacingHeight
    }
    
    
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        }

    
    
    
}
