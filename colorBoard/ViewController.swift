//
//  ViewController.swift
//  colorBoard
//
//  Created by 黄思源 on 2019/1/3.
//  Copyright © 2019 supencil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func reset(_ sender: UIButton) {
        greenSlider.value = 1
        redSlider.value = 1
        blueSlider.value = 1
        greenSwitch.isOn = false
        redSwitch.isOn = false
        blueSwitch.isOn = false
        updateControls()
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
        updateControls()
    }
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBAction func colorViewUISwitch(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled =  blueSwitch.isOn
    }
    
    @IBOutlet weak var colorView: UIView!
    
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        if redSwitch.isOn{
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn{
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn{
            blue = CGFloat(blueSlider.value)
        }
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateControls()
        updateColor()
        
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.white.cgColor
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}

