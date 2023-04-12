//
//  PassengerInfoViewController.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 11.04.2023.
//

import UIKit

class PassengerInfoViewController: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var seatsTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    var times = 0
    
    //MARK: - STORYBOARD FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldSettings()
        dataTransfer()

        
    }
    
    
    //MARK: - BUTTON
    @IBAction func takeTicketBtnClicked(_ sender: Any) {
        getData()
    }
    
    //MARK: - TEXTFIELD SETTINGS FUNC
    private func textFieldSettings() {
        
        let namePlaceHolderText = NSAttributedString(string: "Adınız", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        nameTextField.attributedPlaceholder = namePlaceHolderText
        let surnamePlaceHolderText = NSAttributedString(string: "Soyadınız", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        surnameTextField.attributedPlaceholder = surnamePlaceHolderText
        let idPlaceHolderText = NSAttributedString(string: "TC NO", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        idTextField.attributedPlaceholder = idPlaceHolderText
        priceTextField.isEnabled = false
        seatsTextField.isEnabled = false
    }
    
    //MARK: - DATA TRANSFER FUNC
    private func dataTransfer() {
        let count = UserDefaults.standard.integer(forKey: "count")
        if count != 0 {
            times = count
        }
        
        if let priceString = UserDefaults.standard.string(forKey: "price"), let price = Int(priceString) {
            
            let totalPrice = times * price
            priceTextField.text = "\(totalPrice)"
        }
        
        if let selectedSeats = UserDefaults.standard.array(forKey: "selectedSeats"){
            seatsTextField.text = "\(selectedSeats)"
        }
    }
    
    //MARK: - GET DATA FUNC
    private func getData() {
        let defaults = UserDefaults.standard
        
        if nameTextField.text == "" || surnameTextField.text == "" || idTextField.text == ""{
            makeAlert(titleInput: "Uyarı!", messageInput: "Lütfen tüm alanları dolduruz.")
            return
        }
        
        
        let nameText = nameTextField.text
        let surnameText = surnameTextField.text
        let idText = idTextField.text
        let seatText = seatsTextField.text
        let priceText = priceTextField.text
        
        
        Passenger.shared.name = nameText
        Passenger.shared.surname = surnameText
        Passenger.shared.id = idText
        defaults.set(seatText, forKey: "seatText")
        defaults.set(priceText, forKey: "priceText")
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let displayTicketVC = storyboard.instantiateViewController(withIdentifier: "toDisplayTicket")
        displayTicketVC.modalPresentationStyle = .fullScreen
        self.present(displayTicketVC, animated: true)
        
        
    }
    

   

}
