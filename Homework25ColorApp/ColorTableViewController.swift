//
//  ColorTableViewController.swift
//  Homework25ColorApp
//
//  Created by 黃柏嘉 on 2021/11/30.
//

import UIKit

class ColorTableViewController: UITableViewController {
    
    @IBOutlet weak var backView: UIView!
    //Label
    @IBOutlet weak var color1RedLabel: UILabel!
    @IBOutlet weak var color1GreenLabel: UILabel!
    @IBOutlet weak var color1BlueLabel: UILabel!
    @IBOutlet weak var color1AlphaLabel: UILabel!
    @IBOutlet weak var color2RedLabel: UILabel!
    @IBOutlet weak var color2GreenLabel: UILabel!
    @IBOutlet weak var color2BlueLabel: UILabel!
    @IBOutlet weak var color2AlphaLabel: UILabel!
    //slider
    @IBOutlet weak var color1RedSlider: UISlider!
    @IBOutlet weak var color1GreenSlider: UISlider!
    @IBOutlet weak var color1BlueSlider: UISlider!
    @IBOutlet weak var color1AlphaSlider: UISlider!
    @IBOutlet weak var color2RedSlider: UISlider!
    @IBOutlet weak var color2GreenSlider: UISlider!
    @IBOutlet weak var color2BlueSlider: UISlider!
    @IBOutlet weak var color2AlphaSlider: UISlider!
    
    var gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始漸層
        gradientLayer.colors = [UIColor.green.cgColor,UIColor.yellow.cgColor]
        gradientLayer.locations = [0,0.6,1]
        gradientLayer.frame = backView.bounds
        backView.layer.addSublayer(gradientLayer)
    }

    //隨機，先給slider隨機值後再使用function改變漸層
    @IBAction func randomColor(_ sender: UIButton) {
        let sliderArray = [color1RedSlider,color1GreenSlider,color1BlueSlider,color2GreenSlider,color2RedSlider,color2BlueSlider]
        for array in sliderArray {
            array?.value = Float.random(in: 0...255)
        }
        color1AlphaSlider.value = Float.random(in: 0...1)
        color2AlphaSlider.value = Float.random(in: 0...1)
        changeColor()
        
    }
    //slider IBAction，全部連進這裡
    @IBAction func setColors(_ sender: UISlider) {
        changeColor()
    }
    
    func changeColor(){
        let color1 = CGColor(red: CGFloat(color1RedSlider.value/255), green: CGFloat(color1GreenSlider.value/255), blue: CGFloat(color1BlueSlider.value/255), alpha: CGFloat(color1AlphaSlider.value/1))
        let color2 = CGColor(red: CGFloat(color2RedSlider.value/255), green: CGFloat(color2GreenSlider.value/255), blue: CGFloat(color2BlueSlider.value/255), alpha: CGFloat(color2AlphaSlider.value/1))
        gradientLayer.colors = [color1,color2]
        color1RedLabel.text = "\(Int(color1RedSlider.value))"
        color1GreenLabel.text = "\(Int(color1GreenSlider.value))"
        color1BlueLabel.text = "\(Int(color1BlueSlider.value))"
        color1AlphaLabel.text = String(format: "%.1f", color1AlphaSlider.value)
        color2RedLabel.text = "\(Int(color2RedSlider.value))"
        color2GreenLabel.text = "\(Int(color2GreenSlider.value))"
        color2BlueLabel.text = "\(Int(color2BlueSlider.value))"
        color2AlphaLabel.text = String(format: "%.1f", color2AlphaSlider.value)
    }
}
