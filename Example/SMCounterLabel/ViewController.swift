//
//  ViewController.swift
//  SMCounterLabel
//
//  Created by Slavenko on 1/26/19.
//  Copyright © 2019 Slavenko. All rights reserved.
//

import UIKit
import SMCounterLabel

class ViewController: UIViewController {
    
    @IBOutlet weak var label: SMCounterLabel!
    @IBOutlet weak var dummyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //I recommend using monospaced fonts, since you will get a bit of jitter when animating, since the character width is different on numbers
        label.font = UIFont(name:"Menlo", size: 50)
        
        dummyLabel.font = UIFont(name:"Menlo", size: 50)
        
        //Format type integer/decimal/fancy
        label.formatType = .decimal
        
        //How long it takes to animate one character
        label.duration = 0.6
        
        //How long to wait before the next character starts animating
        label.delay = 0.2
        
        //If for some reason you want the animation to slow down towards the end
        label.durationIncrement = 0.0
        
        //Text color obviously
        label.color = .darkGray
        
        //Set the value
        label.setValue(1234.56)
        dummyLabel.text = "\(label.getValue())"
    }
    
    @IBAction func updateLabel(_ sender: Any) {
        let randomNumber = Double.random(min: 1, max: 9999)
        label.setValue(randomNumber)
        dummyLabel.text = "\(label.getValue())"
    }
}

public extension Double {
    
    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    public static var random: Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }
    
    /// Random double between 0 and n-1.
    ///
    /// - Parameter n:  Interval max
    /// - Returns:      Returns a random double point number between 0 and n max
    public static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}

