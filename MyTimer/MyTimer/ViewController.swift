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
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    
    var timer : Timer?
    var count = 0
    let settingKey = "timer_value"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainLabel.font = UIFont.systemFont(ofSize: 30.0)
        mainLabel.textAlignment = .center
        mainLabel.text = "REMAINED TIME"
        
        let settings = UserDefaults.standard
        settings.register(defaults: [settingKey:10])
        
        
    }

    @IBAction func settingButton(_ sender: Any) {
    
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
        
        performSegue(withIdentifier: "goSetting", sender: nil)
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                return
            }
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerInterrupt(_:)), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func stopButtonAction(_ sender: Any) {
        
        if let nowTimer = timer {
            if nowTimer.isValid == true {
                nowTimer.invalidate()
            }
        }
    }
    
    func displayUpdate() -> Int {
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        let remainCount = timerValue - count
        mainLabel.text = "\(remainCount)"
        
        return remainCount
    }
    
    @objc func timerInterrupt(_ timer: Timer) {
        
        count += 1
        
        if displayUpdate() <= 0 {
            count = 0
            timer.invalidate()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        count = 0
        
        _ = displayUpdate()
    }
    
}

