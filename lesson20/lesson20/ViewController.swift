//
//  ViewController.swift
//  lesson20
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = CarDModel()
    var cardArray = [Card]()
    var firstFlippedCard: IndexPath?
    var timer: Timer?
    var millisecond: Float = 10000
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        cardArray = model.getCards()
        timer = Timer.init(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }

    @objc func timerElapsed () {
        millisecond -= 1
        
        let second = String(format: "%.2f", millisecond/1000)
        timeLabel.text = second
        
        if millisecond <= 0 {
            timer?.invalidate()
            timeLabel.textColor = UIColor.red
            
            checkGameEnd()
        }
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath)
        if let cell = cell as? CardCollectionViewCell {
            cell.setCard(cardArray[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if millisecond <= 0 {
            return
        }
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell {
        
            
            let card = cardArray[indexPath.row]
            if card.isFlipped == false && card.isMatched ==  false {
                cell.flip()
                card.isFlipped = true
                if firstFlippedCard == nil {
                    firstFlippedCard = indexPath
                }
                else {
                    checkForMactch(indexPath)
                }
            }
            else {
                cell.flipback()
                card.isFlipped = false
                firstFlippedCard = nil
            }
            
        }
    }
    
    
    func checkForMactch(_ secondFlippCard: IndexPath) {
        guard let firstFlippedCard = self.firstFlippedCard else { return }
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCard) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippCard) as? CardCollectionViewCell 
        let cardOne = cardArray[firstFlippedCard.row]
        let cardTwo = cardArray[secondFlippCard.row]
                
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMatched = true
            cardTwo.isMatched = true
            cardOneCell?.remove()
            cardTwoCell?.remove()
            checkGameEnd()
        }
        else {
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            cardOneCell?.flipback()
            cardTwoCell?.flipback()
        }
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlippedCard])
        }
        self.firstFlippedCard = nil
    }
   
    func checkGameEnd() {
        var isWon = true
        var title = ""
        var message = ""
        
        
        for card in cardArray {
            if card.isMatched == false {
                isWon = false
                break
            }
        }
        
        if isWon {
            if millisecond > 0 {
                timer?.invalidate()
            }
            title = "Won"
            message = "Won!!!"
        }
        else {
            
            title = "Game Over"
            message = "lost!!!"
            
        }
       showAlert(title: title, message: message)
    }
    
    func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
}
