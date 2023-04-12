//
//  UIViewController + Extension.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 11.04.2023.
//

import UIKit

extension UIViewController {
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert,animated: true)
    }
}
