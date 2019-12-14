//
//  ViewController.swift
//  SwiftLab2020
//
//  Created by Z on 12/11/19.
//  Copyright © 2019 Zyma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presenter: PresenterProtocol?
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var dealButtonView: UIButton!
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = Presenter(view: self)
    }
    
    @IBAction func clickDealButton(_ sender: UIButton) {
        presenter?.updateGame()
    }
}

extension ViewController:  ViewControllerProtocol {
    func update(leftImage: String, rightImage: String) {
        guard let presenter = self.presenter else { return }
        let scoreLeft = presenter.getScore(for: .player)
        let scoreRight = presenter.getScore(for: .cpu)
        DispatchQueue.main.async {
            self.leftImageView.image = UIImage(named: leftImage)
            self.rightImageView.image = UIImage(named: rightImage)
            self.leftScoreLabel.text = scoreLeft
            self.rightScoreLabel.text = scoreRight
        }
    }
}
