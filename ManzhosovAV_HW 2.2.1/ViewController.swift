//
//  ViewController.swift
//  ManzhosovAV_HW 2.2.1
//
//  Created by Александр Манжосов on 19.08.2024.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        rgbView.layer.cornerRadius = 15
        
        redSlider.value = 0
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.value = 0.2
        greenSlider.minimumTrackTintColor = .green

        blueSlider.value = 0.4
        blueSlider.minimumTrackTintColor = .blue
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        
        rgbView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        

    }
   
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTextField.text = String(format: "%.2f", redSlider.value)
            rgbView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value),
                                                   green: CGFloat(greenSlider.value),
                                                   blue: CGFloat(blueSlider.value), alpha: 1)
        case 1:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTextField.text = String(format: "%.2f", greenSlider.value)
            rgbView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value),
                                                   green: CGFloat(greenSlider.value),
                                                   blue: CGFloat(blueSlider.value), alpha: 1)
        case 2:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            blueTextField.text = String(format: "%.2f", blueSlider.value)
            rgbView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value),
                                                   green: CGFloat(greenSlider.value),
                                                   blue: CGFloat(blueSlider.value), alpha: 1)
        default:
            break
        }
    }
   
    func textFieldShouldReturn(_ tf: UITextField) -> Bool {
        switch tf {
        case redTextField:

            if let text = redTextField.text {
                if let value = Float(text) {
                    redSlider.value = value
                    sliderAction(redSlider)
                }
            }
        case greenTextField:
            if let text = greenTextField.text {
                if let value = Float(text) {
                    greenSlider.value = value
                    sliderAction(greenSlider)
                }
            }
        case blueTextField:
            if let text = blueTextField.text {
                if let value = Float(text) {
                    blueSlider.value = value
                    sliderAction(blueSlider)
                }
            }
        default:
            print("не удалось распознать число")
        }
        self.view.endEditing(true)
        return false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case redTextField:
            redTextField.text = ""
        case greenTextField:
            greenTextField.text = ""
        case blueTextField:
            blueTextField.text = ""
        default:
            print("не удалось распознать число")
        }
    }

}

