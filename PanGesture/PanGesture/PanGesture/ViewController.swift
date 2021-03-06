//
//  ViewController.swift
//  PanGesture
//
//  Created by Christine Jiang on 16/08/17.
//  Copyright © 2017 Christine Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var startPoint: CGPoint = CGPoint.zero
    var endPoint: CGPoint = CGPoint.zero
    var customPath : UIBezierPath?
    var layer : CAShapeLayer?
    var selectedShape = Shapes.oval
    var lineCap:String = kCALineCapRound
    let shapeArray = [Shapes.oval, Shapes.rectangle, Shapes.line, Shapes.freeStyle]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer)
    {
        if sender.state == .began
        {
            customPath = UIBezierPath()
            startPoint = sender.location(in: sender.view)
            layer = CAShapeLayer()
            layer?.fillColor = UIColor.transparentBlue.cgColor
            layer?.lineWidth = 1.0
            layer?.strokeColor = UIColor.blue.cgColor
            layer?.lineCap = lineCap
            self.view.layer.addSublayer(layer!)
        }
        else if sender.state == .changed
        {
            switch selectedShape
            {
            case Shapes.oval:
                let translation = sender.translation(in: sender.view)
                layer?.path = ShapePath().oval(startPoint: startPoint, translationPoint: translation).cgPath
                
            case Shapes.rectangle:
                let translation = sender.translation(in: sender.view)
                layer?.path = ShapePath().rectangle(startPoint: startPoint, translationPoint: translation).cgPath
                
            case Shapes.line:
                endPoint = sender.location(in: sender.view)
                layer?.path = ShapePath().line(startPoint: startPoint, endPoint: endPoint).cgPath
                
            case Shapes.freeStyle:
                endPoint = sender.location(in: sender.view)
                customPath?.move(to: startPoint)
                customPath?.addLine(to: endPoint)
                startPoint = endPoint
                customPath?.close()
                layer?.path = customPath?.cgPath
            }
        }
    }
    
    @IBAction func shapeDidSelect(_ sender: UIButton)
    {
        //The code commented is equal to the code below
//        let selectedTag : Int = sender.tag
//        switch selectedTag
//        {
//        case 0:
//            selectedShape = Shapes.oval
//            
//        case 1:
//            selectedShape = Shapes.rectangle
//            
//        case 2:
//            selectedShape = Shapes.line
//        
//        case 3:
//            selectedShape = Shapes.freeStyle
//        
//        default:
//            selectedShape = Shapes.oval
//        }
        selectedShape = shapeArray[sender.tag]
    }
}
