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
    
    var selectedFillColor = padColor.green
    var selectedStrokeColor = padColor.green
    
    var lineCap:String = kCALineCapRound
    let shapeArray = [Shapes.oval, Shapes.rectangle, Shapes.line, Shapes.freeStyle]
    let colorArray = [padColor.red, padColor.yellow, padColor.green, padColor.blue, padColor.purple]
    
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
            switch selectedFillColor
            {
            case padColor.red:
                layer?.fillColor = UIColor.transparentRed.cgColor
            case padColor.yellow:
                layer?.fillColor = UIColor.yellow.cgColor
            case padColor.green:
                layer?.fillColor = UIColor.veryDarkGreen.cgColor
            case padColor.blue:
                layer?.fillColor = UIColor.transparentBlue.cgColor
            case padColor.purple:
                layer?.fillColor = UIColor.transparentPurple.cgColor
                
            default:
                layer?.fillColor = UIColor.transparentBlue.cgColor
            }
            
            switch selectedStrokeColor
            {
            case padColor.red:
                layer?.strokeColor = UIColor.transparentRed.cgColor
            case padColor.yellow:
                layer?.strokeColor = UIColor.yellow.cgColor
            case padColor.green:
                layer?.strokeColor = UIColor.veryDarkGreen.cgColor
            case padColor.blue:
                layer?.strokeColor = UIColor.transparentBlue.cgColor
            case padColor.purple:
                layer?.strokeColor = UIColor.transparentPurple.cgColor
                
            default:
                layer?.fillColor = UIColor.transparentBlue.cgColor
            }
            
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
    
 
    @IBAction func colorDidSelect(_ sender: UIButton) {
        selectedFillColor = colorArray[sender.tag]
        selectedStrokeColor = colorArray[sender.tag]
    }
    
    @IBAction func shapeDidSelect(_ sender: UIButton)
    {
        selectedShape = shapeArray[sender.tag]
    }
}
