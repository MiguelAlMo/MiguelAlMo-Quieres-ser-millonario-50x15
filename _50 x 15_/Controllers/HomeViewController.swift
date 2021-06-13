//
//  HomeViewController.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 10/6/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var buttonStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStart.borderColor(value: 2, color: .white)
        buttonStart.layer.cornerRadius = 8
        buttonStart.backgroundColor = .black.withAlphaComponent(0.5)
        delayWithSeconds(1){
            soundHome(titleSong: "Sintonia_50x15")
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonStart.flash(numberOfFlashes: 100)
    }
    
}
