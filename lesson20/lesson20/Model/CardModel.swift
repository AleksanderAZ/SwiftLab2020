//
//  CardModel.swift
//  lesson20
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

class CarDModel {
    
    func getCards() -> [Card] {
        
        var generatedCardsarray = [Card]()
        
        for _ in 1...8 {
            
            let randomNumber = arc4random_uniform(13) + 1
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generatedCardsarray.append(cardOne)
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generatedCardsarray.append(cardTwo)
        }
        
        
        
        return generatedCardsarray
    }
}
