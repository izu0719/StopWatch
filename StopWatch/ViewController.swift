//
//  ViewController.swift
//  StopWatch
//
//  Created by 坂本 泉 on 2020/02/08.
//  Copyright © 2020 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    @IBOutlet var hanteiLavel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        hanteiLavel.text = ""
    }
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
        if count > 9.80 && count < 10.20{
            hanteiLavel.text = "PERFECT!"
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.00
        label.text = String(format: "%.2f", count)
        hanteiLavel.text = ""
    }
}

