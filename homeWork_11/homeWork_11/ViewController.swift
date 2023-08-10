//
//  ViewController.swift
//  homeWork_11
//
//  Created by Евгений Лойко on 9.08.23.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var btnSetTime: UIButton!
    @IBOutlet private weak var lblTime: UILabel!
    @IBOutlet private weak var switcher: UISwitch!
    @IBOutlet private weak var btnClear: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func setupUI() {
            textField.text = String(slider.value)
            lblTime.text = "__:__"
            switcher.isEnabled = false
        }
        setupUI()
    }
    
    @IBAction private func sliderValue(_ sender: UISlider) {
        textField.text = String(slider.value)
        progressView.progress = slider.value
    }
    
    @IBAction private func textFieldChange(_ sender: UITextField) {
        if let value = textField.text {
            if let unwrpValue = Float(value) {
                slider.value = unwrpValue
                progressView.progress = unwrpValue
            }
        }
    }
    
    @IBAction private func setTime(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        lblTime.text = formatter.string(from: datePicker.date)
        switcher.isEnabled = true
        switcher.isOn = true
        lblTime.textColor = .purple
    }
    
    @IBAction private func switchOnOff(_ sender: UISwitch) {
        if switcher.isOn && lblTime.text != "__:__" {
            lblTime.textColor = .purple
        } else {
            lblTime.textColor = .black
            switcher.isOn = false
        }
    }
    
    @IBAction private func clearAlarm(_ sender: UIButton) {
        lblTime.text = "__:__"
        switcher.isOn = false
        switcher.isEnabled = false
        lblTime.textColor = .black
    }
}
