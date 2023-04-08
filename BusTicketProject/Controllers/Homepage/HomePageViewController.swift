//
//  HomePageViewController.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 5.04.2023.
//

import UIKit

class HomePageViewController: UIViewController {
    
    
    @IBOutlet weak var fromWhereButton: UIButton!
    @IBOutlet weak var fromWhereTableView: UITableView!
    @IBOutlet weak var toWhereButton: UIButton!
    @IBOutlet weak var toWhereTableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var foundTicketButton: UIButton!
    
    var departurePoint: String?
    var destinationPoint: String?
    
    
    
    var citiesList = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
                      "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
                      "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
                      "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
                      "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
                      "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
                      "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
                      "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
                      "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "UCUZ YOLCUM"
        TableViewCall()
        fromWhereTableView.isHidden = true
        toWhereTableView.isHidden = true
        
        
    }
    
    
    @IBAction func fromWherBtnClicked(_ sender: Any) {
        
        if fromWhereTableView.isHidden {
            animate(toogle: true, tableView: fromWhereTableView)
        } else {
            animate(toogle: false, tableView: fromWhereTableView)
        }
        
    }
    
    
    @IBAction func toWhereButtonClicked(_ sender: Any) {
        
        if toWhereTableView.isHidden {
            animate(toogle: true, tableView: toWhereTableView)
        } else {
            animate(toogle: false, tableView: toWhereTableView)
        }
        
    }
    
    
    @IBAction func foundTicketBtnClicked(_ sender: Any) {
    }
    
    
    func animate(toogle: Bool, tableView: UITableView) {

              if toogle {
                UIView.animate(withDuration: 0.5, delay: 0 ) {
                    tableView.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.5, delay: 0) {
                    tableView.isHidden = true
              }
            
        }
            
        
        
    }
    
    
    func TableViewCall() {
        fromWhereTableView.delegate = self
        fromWhereTableView.dataSource = self
        
        toWhereTableView.delegate = self
        toWhereTableView.dataSource = self
        
    }
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
    
    func getDateAndTime () {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let date = dateFormatter.string(from: datePicker.date)
        
        let calendar = datePicker.calendar
        let hour = String((calendar?.component(.hour, from: datePicker.date))!)
        var minute = String((calendar?.component(.minute, from: datePicker.date))!)
        
        if minute == "0" { minute += "0"}
        let time = "\(hour):\(minute)"
        
        Ticket.shared.date = date
        Ticket.shared.time = time
        
    }
    
    
}





extension HomePageViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        if tableView == fromWhereTableView {
            let cellFromWhere =  fromWhereTableView.dequeueReusableCell(withIdentifier: "fromWhereCell", for: indexPath)
            cellFromWhere.textLabel?.text = citiesList[indexPath.row]
            cellFromWhere.textLabel?.textColor = .white
            return cellFromWhere
        } else {
            let cellToWhere =  toWhereTableView.dequeueReusableCell(withIdentifier: "toWhereCell", for: indexPath)
            cellToWhere.textLabel?.text = citiesList[indexPath.row]
            cellToWhere.textLabel?.textColor = .white
            return cellToWhere
        }
                
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        if tableView == fromWhereTableView {
            fromWhereButton.setTitle("\(citiesList[indexPath.row])", for: UIControl.State.normal)
            animate(toogle: false, tableView: fromWhereTableView)
        } else {
            toWhereButton.setTitle("\(citiesList[indexPath.row])", for: UIControl.State.normal)
            animate(toogle: false, tableView: toWhereTableView)
            }
            
        if fromWhereButton.titleLabel?.text == toWhereButton.titleLabel?.text {
            makeAlert(titleInput: "Hata", messageInput: "Lütfen farklı şehirler giriniz.")
            toWhereButton.setTitle("", for: UIControl.State.normal)
        }
        
    }


    
    
    
}
