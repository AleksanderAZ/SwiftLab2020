//
//  Presenter.swift
//  SwiftLab2020
//
//  Created by Z on 12/14/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import Foundation


class Presenter: PresenterProtocol {
    
    func getNameImage() -> String {
      let number = Int.random(in: 2...14)
      let nameImage = "card\(number)"
        return nameImage
    }
}
