//
//  ViewController.swift
//  lesson28
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardArray = [Card]()
    var firstFlippedCard: IndexPath?
    var timer: Timer?
    var millisecond: Float = 40000
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        startGame()
    }

    func startGame() {
        cardArray = CardModel.getCards()
        millisecond = 40000
        timer = Timer.init(timeInterval: 0.001, target: self, selector: #selector(timerElapsed), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SoundManager.play(.shuffle)
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
            if let firstFlippedCard = self.firstFlippedCard {
                if firstFlippedCard.row == indexPath.row {
                    cell.flip()
                }
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard millisecond > 0  else { return }
        checkForMactch(indexPath)
    }
    
    func checkForMactch(_ cardIndexPath: IndexPath) {
        let cardCell = collectionView.cellForItem(at: cardIndexPath) as? CardCollectionViewCell
        let card = cardArray[cardIndexPath.row]
        if !card.isMatched {
            SoundManager.play(.flip)
            cardCell?.flip()
            if let firstFlippedCard = self.firstFlippedCard {
                if firstFlippedCard.row != cardIndexPath.row {
                    let cardFirstCell = collectionView.cellForItem(at: firstFlippedCard) as? CardCollectionViewCell
                    let cardFirst = cardArray[firstFlippedCard.row]
                    if(card.isCard(cardFirst.getCard())) {
                        SoundManager.play(.match)
                        card.isMatched = true
                        cardCell?.remove()
                        cardFirstCell?.remove()
                        checkGameEnd()
                    }
                    else {
                        SoundManager.play(.nomatch)
                        cardCell?.flipback()
                        cardFirstCell?.flipback()
                    }
                    if cardFirstCell == nil {
                        collectionView.reloadItems(at: [firstFlippedCard])
                    }
                    self.firstFlippedCard = nil
                }
                
            }
            else
            {
                self.firstFlippedCard = cardIndexPath
            }
        }
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
            showAlert(title: title, message: message)
        }
        else {
            if millisecond <= 0 {
                title = "Game Over"
                message = "lost!!!"
                showAlert(title: title, message: message)
            }
        }
       
    }
    
    func showAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
}
