//
//  ViewController.swift
//  SwiftLab2020
//
//  Created by Z on 12/11/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let presenter = Presenter()
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var dealButtonView: UIButton!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickDealButton(_ sender: UIButton) {
        leftImageView.image = UIImage(named: presenter.getNameImage())
        rightImageView.image = UIImage(named: presenter.getNameImage())
    }
}

