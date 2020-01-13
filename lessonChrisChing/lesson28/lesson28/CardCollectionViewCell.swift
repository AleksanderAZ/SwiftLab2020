//
//  CardCollectionViewCell.swift
//  lesson28
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
   
    var card: Card?
    
    func setCard(_ card: Card) {
        
        self.card = card
        
        if card.isMatched {
            self.backImageView.alpha = 0
            self.frontImageView.alpha = 0
            return
        }
        else {
            self.backImageView.alpha = 1
            self.frontImageView.alpha = 1
        }
        
        frontImageView.image = UIImage(named: card.getCard())
    }
    
    func flip() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.backImageView, to: self.frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flipback() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    func remove() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.backImageView.alpha = 0
            UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
                self.frontImageView.alpha = 0
            }, completion: nil)
        }
    }
}
