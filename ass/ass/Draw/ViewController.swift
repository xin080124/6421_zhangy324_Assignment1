//
//  ViewController.swift
//  Draw
//
//  Created by Christine Jiang on 3/08/17.
//  Copyright © 2017 Christine Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var startPoint = CGPoint()
    //
    var layer : CAShapeLayer!
    
    var colorIndex = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func yxGetColor()
    {
        if(colorIndex == 0)
        {
            layer?.fillColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 0.5).cgColor
            layer?.strokeColor = UIColor.black.cgColor
        }
        else if(colorIndex == 1)
        {
            layer?.fillColor = UIColor.init(red: 0, green: 255, blue: 0, alpha: 0.5).cgColor
            layer?.strokeColor = UIColor.black.cgColor
        }
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        colorIndex = 1
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer)
    {
        if sender.state == .began
        {
           startPoint = sender.location(in: sender.view)
           layer = CAShapeLayer()
           //layer?.fillColor = UIColor.init(red: 255, green: 0, blue: 0, alpha: 0.5).cgColor
           //layer?.strokeColor = UIColor.black.cgColor
           yxGetColor()
            self.view.layer.addSublayer(layer!)
        }
        else if sender.state == .changed
        {
            let translation = sender.translation(in: self.view)
            layer?.path = (UIBezierPath(ovalIn:CGRect(x:startPoint.x,
                                                      y: startPoint.y,
                                                      width: translation.x,
                                                      height: translation.y))).cgPath
        }
    }
}

