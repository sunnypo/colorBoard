//
//  ViewController.swift
//  colorBoard
//
//  Created by 黄思源 on 2019/1/3.
//  Copyright © 2019 supencil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 重置为初始值
    @IBAction func reset(_ sender: UIButton) {
        greenSlider.value = 1
        redSlider.value = 1
        blueSlider.value = 1
        greenSwitch.isOn = false
        redSwitch.isOn = false
        blueSwitch.isOn = false
        updateControls()
    }
    // 当view里的控件发生变化后更新颜色和控制
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
    
    // 我认为这个可以和上面的sliderChanged合并 :)
    @IBAction func colorViewUISwitch(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    // switch打开时才会请允许slider的使用
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled =  blueSwitch.isOn
    }
    
    @IBOutlet weak var colorView: UIView!
    
    // 从三个Switch和Slider的值得出颜色，更新到colorView的background里去
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

