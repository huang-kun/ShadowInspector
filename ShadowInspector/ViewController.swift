//
//  ViewController.swift
//  ShadowInspector
//
//  Created by huangkun on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cube: UIView!
    
    @IBOutlet weak var offsetXLabel: UILabel!
    @IBOutlet weak var offsetYLabel: UILabel!
    @IBOutlet weak var radiusLabel: UILabel!
    @IBOutlet weak var opacityLabel: UILabel!
    @IBOutlet weak var cornerRadiusLabel: UILabel!
    
    @IBOutlet weak var offsetXSlider: UISlider!
    @IBOutlet weak var offsetYSlider: UISlider!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    
    @IBOutlet var colorButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set default shadow value
        offsetXSlider.value = Float(cube.layer.shadowOffset.width)
        offsetYSlider.value = Float(cube.layer.shadowOffset.height)
        radiusSlider.value = Float(cube.layer.shadowRadius)
        
        updateShadowColor(.black)
        updateShadowOffsetX(offsetXSlider.value)
        updateShadowOffsetY(offsetYSlider.value)
        updateShadowRadius(radiusSlider.value)
        updateShadowOpacity(opacitySlider.value)
        updateCornerRadius(cornerRadiusSlider.value)
        
        // Set digit font
        let valueLabels = [offsetXLabel, offsetYLabel, radiusLabel, opacityLabel, cornerRadiusLabel]
        for label in valueLabels {
            label?.font = UIFont.monospacedDigitSystemFont(ofSize: 17, weight: .regular)
        }
        
        // Add button action
        for button in colorButtons {
            button.addTarget(self, action: #selector(adjustColor(_:)), for: .touchUpInside)
        }
    }
    
    // MARK: - Value updates
    
    func updateShadowColor(_ color: UIColor) {
        cube.layer.shadowColor = color.cgColor
    }
    
    func updateShadowOffsetX(_ value: Float) {
        cube.layer.shadowOffset.width = CGFloat(value)
        offsetXLabel.text = String(format: "%0.1f", value)
    }
    
    func updateShadowOffsetY(_ value: Float) {
        cube.layer.shadowOffset.height = CGFloat(value)
        offsetYLabel.text = String(format: "%0.1f", value)
    }
    
    func updateShadowRadius(_ value: Float) {
        cube.layer.shadowRadius = CGFloat(value)
        radiusLabel.text = String(format: "%0.1f", value)
    }
    
    func updateShadowOpacity(_ value: Float) {
        cube.layer.shadowOpacity = value
        opacityLabel.text = String(format: "%0.1f", value)
    }
    
    func updateCornerRadius(_ value: Float) {
        cube.layer.cornerRadius = CGFloat(value)
        cornerRadiusLabel.text = String(format: "%0.1f", value)
    }
    
    // MARK: - Actions
    
    @IBAction func adjustOffsetX(_ sender: UISlider) {
        updateShadowOffsetX(sender.value)
    }
    
    @IBAction func adjustOffsetY(_ sender: UISlider) {
        updateShadowOffsetY(sender.value)
    }
    
    @IBAction func adjustRadius(_ sender: UISlider) {
        updateShadowRadius(sender.value)
    }
    
    @IBAction func adjustOpacity(_ sender: UISlider) {
        updateShadowOpacity(sender.value)
    }
    
    @IBAction func adjustCornerRadius(_ sender: UISlider) {
        updateCornerRadius(sender.value)
    }
    
    @objc func adjustColor(_ sender: UIButton) {
        updateShadowColor(sender.backgroundColor ?? .clear)
    }
}

