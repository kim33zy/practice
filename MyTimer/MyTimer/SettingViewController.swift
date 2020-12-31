//
//  SettingViewController.swift
//  MyTimer
//
//  Created by Kim Kyung Dong on 12/31/20.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let settings = UserDefaults.standard
        settings.setValue(settingArray[row], forKey: settingKey)
        settings.synchronize()
    }

    let settingArray : [Int] = [10, 20, 30, 40, 50, 60]
    let settingKey = "timer_value"
    
    @IBOutlet weak var timerSettingPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        timerSettingPicker.delegate = self
        timerSettingPicker.dataSource = self
        
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timerSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }

    }
    @IBAction func decisionButtonAction(_ sender: Any) {
    
        _ = navigationController?.popViewController(animated: true)
    
    }
    
}
