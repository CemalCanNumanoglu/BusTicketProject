//
//  UView+Extension.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
