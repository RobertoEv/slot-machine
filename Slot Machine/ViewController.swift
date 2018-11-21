//
//  ViewController.swift
//  Slot Machine
//
//  Created by Roberto Evangelista da Silva Filho on 20/11/2018.
//  Copyright © 2018 Roberto Evangelista da Silva Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    let countries = [UIImage(named: "alemanha.png"),
                     UIImage(named: "argentina.png"),
                     UIImage(named: "brasil.png"),
                     UIImage(named: "japao.png"),
                     UIImage(named: "canada.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    
    @IBAction func letsRow(_ sender: UIButton) {
        let firstNumber = Int.random(in: 0..<countries.count)
        let secondNumber = Int.random(in: 0..<countries.count)
        let thirdNumber = Int.random(in: 0..<countries.count)
        
        picker.selectRow(firstNumber, inComponent: 0, animated: true)
        picker.selectRow(secondNumber, inComponent: 1, animated: true)
        picker.selectRow(thirdNumber, inComponent: 2, animated: true)
        
        if firstNumber == secondNumber && firstNumber == thirdNumber {
            resultadoLabel.text = "You Win"
        } else {
            resultadoLabel.text = "You Lose"
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let IV = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        IV.image = countries[row]
        return IV
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return countries[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(countries[row])
//    }
}
