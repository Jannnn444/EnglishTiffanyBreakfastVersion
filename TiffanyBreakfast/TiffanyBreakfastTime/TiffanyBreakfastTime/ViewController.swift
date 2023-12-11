//
//  ViewController.swift
//  TiffanyBreakfastTime
//
//  Created by yucian huang on 2023/11/22.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var flavourSegments: UISegmentedControl!
    @IBOutlet weak var heatSlider: UISlider!
    @IBOutlet weak var blackCoffeeSwitch: UISwitch!
    @IBOutlet weak var iceSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var secondLable: UILabel!
    @IBOutlet weak var iceLabel: UILabel!
    
    var croissant = "Classic Original"
    var blackTea = ""
    var sugar = "Sugar Free"
    var ice = "Ice Free"
    var order = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = " Kindly place your order! "
    }
    
//choose croissant flavour
    @IBAction func changeFlavour(_ sender: UISegmentedControl) {
        if flavourSegments.selectedSegmentIndex == 0 {
            croissant = "Classic Original"
        }else if flavourSegments.selectedSegmentIndex == 1 {
            croissant = "Strawberry BubbleGum"
        } else {
            croissant = "Chocolate Wonka"
        }
    }
            
//add the black tea switch
            @IBAction func blackCoffeeSwitchChanged(_ sender: UISwitch) {
                guard let blackSwitch = blackCoffeeSwitch else {
                       print("blackCoffeeSwitch is nil")
                       return
                   }

                   if blackSwitch.isOn {
                       blackTea = "☕️Add Coffee"
                   } else {
                       blackTea = ""
                   }
               }
//adjust heat
    @IBAction func changeHeat(_ sender: UISlider) {
//set slider into interger
        heatSlider.value.round()
        if heatSlider.value == 1 {
            secondLable.text = "Heat up 0secs"
        }else if heatSlider.value == 2 {
            secondLable.text = "Heat up 10secs"
        }else if heatSlider.value == 3 {
            secondLable.text = "Heat up 20secs"
        }else if heatSlider.value == 4 {
            secondLable.text = "Heat up 30secs"
        }else if heatSlider.value == 5 {
            secondLable.text = "Heat up 40secs"
        }else if heatSlider.value == 6 {
            secondLable.text = "Heat up 50secs"
        }else{
            secondLable.text = "Heat up 60secs"
            
        }
    }
    
//ice adjust
    @IBAction func changeIce(_ sender: UISlider) {
        //set the slidre into interger
        iceSlider.value.round()
        //set the slider from 1-4, by if else, was set 1-4
        if iceSlider.value == 1 {
            iceLabel.text = "Ice Free"
        }else if iceSlider.value == 2{
            iceLabel.text = "Slight Ice"
        }else if iceSlider.value == 3{
            iceLabel.text = "Less Ice"
        }else{
            iceLabel.text = "Normal Ice"
        }
    }
    
// send the order output
        @IBAction func orderButton(_ sender: UIButton) {
            let name = nameTextField.text!
            
            if name == "" {
                resultLabel.text = "Please fill in your order name"
            }else if blackCoffeeSwitch.isOn == false {
                resultLabel.text = name + "Moring I'd like to order：\n\n" + croissant + "Croissant\n\n" + secondLable.text!
            }else{
                resultLabel.text = name + " would love to have：\n\n" + croissant + " croissant\n\n🔥" + secondLable.text! + blackTea+iceLabel.text!
            }
//end the keyboard
            view.endEditing(true)
            }
//clear infos
        @IBAction func clearButton(_ sender: UIButton) {
            nameTextField.text = ""
            flavourSegments.selectedSegmentIndex = 0

            resultLabel.text = ""
            }
        }
        
    
