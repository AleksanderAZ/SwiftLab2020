//
//  Presenter.swift
//  SwiftLab2020
//
//  Created by Z on 12/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

enum Players {
    case player
    case cpu
}

class Presenter: PresenterProtocol {
    weak private var viewGame: ViewControllerProtocol?
    private var scorePlayer: Int
    private var scoreCPU: Int
    
    init(view: ViewControllerProtocol) {
        self.viewGame = view
        self.scorePlayer = 0
        self.scoreCPU = 0
    }
    
    func updateGame() {
        let numberImagePlayer = Int.random(in: 2...14)
        let numberImageCPU = Int.random(in: 2...14)
        if (numberImagePlayer > numberImageCPU) {
            scorePlayer += 1
        }
        if (numberImagePlayer < numberImageCPU) {
            scoreCPU += 1
        }
        let leftImage = "card\(numberImagePlayer)"
        let rightImage = "card\(numberImageCPU)"
        viewGame?.update(leftImage: leftImage, rightImage: rightImage)
    }
    
    func getScore(for player: Players) -> String {
        var score: Int
        switch player {
        case .player:
            score = self.scorePlayer
            break
        case .cpu:
            score = self.scoreCPU
            break
        }
        return  "\(score)"
    }    
}
