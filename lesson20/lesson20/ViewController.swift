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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardArray = model.getCards()
    }


}

