//
//  Protocol.swift
//  SwiftLab2020
//
//  Created by Z on 12/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation

protocol PresenterProtocol: class {
    func getScore(for player: Players) -> String
    func updateGame()
}

protocol ViewControllerProtocol: class {
    var presenter: PresenterProtocol? {get set}
    func update(leftImage: String, rightImage: String)
}
