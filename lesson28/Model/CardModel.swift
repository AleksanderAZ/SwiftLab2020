//
//  CardModel.swift
//  lesson28
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

// MARK: - CardModel

class CardModel {
    
    static func getCards(_ countPairCard: Int = 8) -> [Card] {
        var generatedCardsArray = [Card]()
        
        for _ in 1...countPairCard  {
            let randomNumber = arc4random_uniform(13) + 1
            let card = Card("card\(randomNumber)")
            generatedCardsArray.append(card)
            generatedCardsArray.append(card)
        }
        
        for i in 0..<generatedCardsArray.count {
            let randomNumber = arc4random_uniform(UInt32(generatedCardsArray.count))
            let temp = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[Int(randomNumber)]
            generatedCardsArray[Int(randomNumber)] = temp
        }
        
        return generatedCardsArray
    }
}
