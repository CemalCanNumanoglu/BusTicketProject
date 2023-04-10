//
//  OnBoardingViewController.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 3.04.2023.
//

import UIKit

class OnBoardingViewController: UIViewController {

    //MARK: - IBOUTLETS
    @IBOutlet weak var controlView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - PROPERTIES
    var slides: [OnboardingSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            }else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewcontroll()
        
        
        
        slides = [
            OnboardingSlide(title: "Ucuz Yolcum Uygulamasına Hoş Geldin. :)", description: "Bu uygulama ile kolayca ucuza bilet bulup rahat ve kaliteli bir yolculuğun tadını çıkarabilirsin.", image: UIImage(named: "busicon")!),
            OnboardingSlide(title: "Biletini Al", description: "Hızlı ve ucuz bilet almak artık çok daha kolay.", image: UIImage(named: "busticket")!),
            OnboardingSlide(title: "3D Security ile Güvenli Ödemeni Yap", description: "Siber suçların fazla olduğu bu günlerde bu uygulamada içiniz rahar bir şekilde ödeme yapabilirsiniz.", image: UIImage(named: "security")!),
            OnboardingSlide(title: "Muhteşem Yolculuğun Tadını Çıkar", description: "Firmamızın yolcuk esnasında sağladığı imkanlar(yemek,içecek,internet vb.) ile harika bir yolculuk geçirmenizi dileriz... :)", image: UIImage(named: "wifibus")!)
        ]
        
        pageControl.numberOfPages = slides.count

        
    }
    
    //MARK: - DELEGATE,DATA SOURCE FUNC
    private func viewcontroll() {
        controlView.delegate = self
        controlView.dataSource = self
    }
    

   //MARK: - BUTTON FUNC
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(identifier: "homeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            controlView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
      
        
    }
    
}

//MARK: - EXTENSION
extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: controlView.frame.width, height: controlView.frame.height)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
    
}
