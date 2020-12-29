//
//  ViewController.swift
//  MyTimer
//
//  Created by Kim Kyung Dong on 12/30/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLabel.font = UIFont.systemFont(ofSize: 30.0)
        mainLabel.textAlignment = .center
        mainLabel.text = "REMAINED TIME"
    
    }


}

