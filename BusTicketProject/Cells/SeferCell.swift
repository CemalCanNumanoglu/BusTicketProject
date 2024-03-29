//
//  SeferCellCode.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 9.04.2023.
//

import UIKit

class SeferCell: UITableViewCell{
    
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var deparatureLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var price: Int?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
   
    
    //MARK: - FUNCS
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(model: SeferModel) {
        self.companyImage.image = UIImage(named: model.companyImage)
        self.companyNameLabel.text = model.companyName
        self.deparatureLabel.text = model.deparaturePoint
        self.destinationLabel.text = model.destinationPoint
        self.priceLabel.text = String(model.price)
        self.timeLabel.text = model.time
        price = model.price
    }
    
    
}
