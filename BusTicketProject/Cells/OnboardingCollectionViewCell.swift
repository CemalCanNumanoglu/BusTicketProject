//
//  OnboardingCollectionViewCell.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    //MARK: - IBOUTLES
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    //MARK: - F
    func setup(_ slide: OnboardingSlide) {
        
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        
    }
    
}
