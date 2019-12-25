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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        cardArray = model.getCards()
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
    
}
