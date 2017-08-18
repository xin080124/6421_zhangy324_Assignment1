//
//  DrawView.swift
//  TestDraw
//
//  Created by Christine Jiang on 11/08/17.
//  Copyright © 2017 Christine Jiang. All rights reserved.
//

import UIKit

class DrawView: UIView
{
    override func draw(_ rect: CGRect)
    {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:20, y:20))
        aPath.addLine(to: CGPoint(x:100, y:100))
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        aPath.addLine(to: CGPoint(x: 100, y: 200))
        aPath.addLine(to: CGPoint(x: 200, y: 300))
        UIColor.blue.set()
        aPath.stroke()
        aPath.close()
    }
}
