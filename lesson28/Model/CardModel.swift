//
//  CardModel.swift
//  lesson28
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

class CarDModel {
    
    func getCards() -> [Card] {
        
        var generatedNumbersArray = [Int]()
        
        var generatedCardsArray = [Card]()
        
        while (generatedNumbersArray.count < 8) {
            
            let randomNumber = arc4random_uniform(13) + 1
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                generatedNumbersArray.append(Int(randomNumber))
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardOne)
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardTwo)
            }
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
