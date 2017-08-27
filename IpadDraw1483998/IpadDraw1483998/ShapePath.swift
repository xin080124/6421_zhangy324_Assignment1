//
//  ShapePath.swift
//
//  

import UIKit

class ShapePath: UIBezierPath
{
    func oval(startPoint: CGPoint, translationPoint: CGPoint) -> UIBezierPath
    {
        return UIBezierPath(ovalIn: CGRect(x: startPoint.x, y: startPoint.y, width:translationPoint.x, height: translationPoint.y))
    }
    
    func rectangle(startPoint: CGPoint, translationPoint: CGPoint) -> UIBezierPath
    {
        return UIBezierPath(rect: CGRect(x: startPoint.x, y: startPoint.y, width: translationPoint.x, height: translationPoint.y))
    }
    
    func line(startPoint: CGPoint, endPoint: CGPoint) -> UIBezierPath
    {
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: startPoint.x, y: startPoint.y))
        linePath.addLine(to: CGPoint(x: endPoint.x, y: endPoint.y))
        return linePath
    }
}
