//
//  Card.swift
//  lesson28
//
//  Created by Z on 12/25/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation


// MARK  - CardModel
class Card {
    
    private var imageName: String = ""
    var isMatched: Bool = false
    
    init(_ imageName: String) {
        self.imageName = imageName
    }
    
    func isCard(_ imageName: String)->Bool {
        if(self.imageName == imageName) { return true }
        return false
    }
    
    func getCard()->String {
        return self.imageName
    }
}
