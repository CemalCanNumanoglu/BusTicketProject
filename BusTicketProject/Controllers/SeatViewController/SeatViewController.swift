//
//  SeatViewController.swift
//  BusTicketProject
//
//  Created by Cemal can Numanoğlu on 10.04.2023.
//

import UIKit

class SeatViewController: UIViewController {

    
    //MARK: - IBOUTLETS
    
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - PROPERTIES
    var totalSeats = 55
    var soldSeats = [Int]()
    var selectedSeats = [Int]()
    var corridorNum = Int()
    var seatNum = Int()
    var seatDict = [Int : String]()
    let bookedSeats = [1,5,14,21,36]
    var price: Int?
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewCall()
        corridorNum = 2
        seatNum = 1
        
        for i in 0..<totalSeats {
            if i == corridorNum {
                if  i == 52 {
                    seatDict[i] = String(seatNum)
                    seatNum += 1
                }else {
                    seatDict[i] = ""
                    corridorNum += 5
                }
            }else {
                seatDict[i] = String(seatNum)
                seatNum += 1
            }
        }
        
    }
    
    
    @IBAction func buyTicketClicked(_ sender: Any) {
        if selectedSeats.isEmpty {
            makeAlert(titleInput: "Uyarı!", messageInput: "Lütfen en az 1 bilet seçiniz")
        }
    }
    
    private func collectionViewCall() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

//MARK: - EXTENSION
extension SeatViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSeats
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as? SeatCollectionViewCell {
            cell.contentView.alpha = 1
            cell.isUserInteractionEnabled = true
            let text = seatDict[indexPath.row]
            
            let numOfSeat = Int(seatDict[indexPath.row] ?? "0") ?? 0
            
            if bookedSeats.contains(numOfSeat) {
                cell.seatImageView.image = UIImage(named: "sold")
                cell.seatNumLabel.textColor = .white
            } else if isSelected(seatNum: numOfSeat) {
                    cell.seatImageView.image = UIImage(named: "selected")
                    cell.seatNumLabel.textColor = .red

            } else {
                cell.seatImageView.image = UIImage(named: "empty")
                cell.seatNumLabel.textColor = .red
            }
            
            cell.seatNumLabel.text = text
            
            if text == "" {
                cell.contentView.alpha = 0
                cell.isUserInteractionEnabled = false
            }
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    private func isSold(seatNum: Int) -> Bool {
        for seat in self.soldSeats {
            if seatNum == seat {
                return true
            }
        }
        return false
    }
    
    private func isSelected(seatNum: Int) -> Bool {
        for seat in selectedSeats {
            if seatNum == seat {
                return true
            }
        }
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? SeatCollectionViewCell
        guard let seat = Int(seatDict[indexPath.row] ?? "-1"), seat != -1 else { return }
        
        if selectedSeats.contains(seat) {
            if let index = selectedSeats.firstIndex(of: seat){
                selectedSeats.remove(at: index)
            }
            collectionView.reloadData()
        }else if bookedSeats.contains(seat) {
            makeAlert(titleInput: "Uyarı!", messageInput: "Bu koltuk daha önce satılmış. Lütfen başka koltuk seçiniz.")
        }else {
            if selectedSeats.count >= 5 {
                       makeAlert(titleInput: "Uyarı!", messageInput: "En fazla 5 koltuk seçebilirsiniz.")
                       return
                   }
            selectedSeats.append(seat)
            collectionView.reloadData()
        }
        
        UserDefaults.standard.set(selectedSeats, forKey: "selectedSeats")
        UserDefaults.standard.set(selectedSeats.count, forKey: "count")
    }
    
    
}
