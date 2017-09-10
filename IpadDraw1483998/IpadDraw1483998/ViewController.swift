//
//  ViewController.swift
//  IpadDraw1483998
//
//

import UIKit

class ViewController: UIViewController
{

    //define a UIView to draw all the shapes on.
    @IBOutlet weak var DrawRegion: UIView!
    
    var startPoint: CGPoint = CGPoint.zero
    var endPoint: CGPoint = CGPoint.zero
    var customPath : UIBezierPath?
    var layer : CAShapeLayer?
    var selectedShape = Shapes.oval
    
    var selectedFillColor = padColor.green
    var selectedStrokeColor = padColor.green
    
    var lineCap:String = kCALineCapRound
    let shapeArray = [Shapes.oval, Shapes.rectangle, Shapes.line, Shapes.freeStyle, Shapes.circle, Shapes.square, Shapes.dash]
    let colorArray = [padColor.red, padColor.yellow, padColor.green, padColor.blue, padColor.purple, padColor.eras]
    
    var erasing:Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //To be completed,used to save the current view to album
    func saveDrawView()
    {
        
    }

    func takeImage() -> UIImage {
        UIGraphicsBeginImageContext(DrawRegion.bounds.size)
        DrawRegion.backgroundColor?.setFill()
        UIRectFill(DrawRegion.bounds)
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    @IBAction func saveImage(_ sender: UIButton) {
       //self.saveDrawView()
    
        let renderer = UIGraphicsImageRenderer(size: DrawRegion.bounds.size)
        let image = renderer.image { ctx in
            DrawRegion.drawHierarchy(in: DrawRegion.bounds, afterScreenUpdates: true)
        }
        
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //when click the "eraser" button
    @IBAction func myEraser(_ sender: UIButton) {
        erasing = true
    }
    
    //when click the "Trash" button
    @IBAction func DeleteDraw(_ sender: UIButton) {
        
        //show a warning box to reminder user
        let alertController = UIAlertController(title: "Warning", message: "Sure to delete?", preferredStyle: UIAlertControllerStyle.alert)
        
        //put the Cancel action at the right side
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
        
        //put the Confirm action at the left side
    let okAction = UIAlertAction(title: "Delete all", style: UIAlertActionStyle.cancel) {(UIAlertAction)->Void in self.DrawRegion.layer.sublayers = nil}
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
        
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
            
            self.DrawRegion.layer.addSublayer(layer!)
        }
        else if sender.state == .changed
        {
            if(erasing == false)
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
 
                    case Shapes.circle:
                        layer?.fillColor = UIColor.transparentFully.cgColor
                        var translation = sender.translation(in: sender.view)
                        if(translation.x < translation.y )
                        {
                            translation.y = translation.x
                        }
                        else
                        {
                            translation.x = translation.y
                        }
                        layer?.path = ShapePath().oval(startPoint: startPoint, translationPoint: translation).cgPath
            
                    case Shapes.square:
                        layer?.fillColor = UIColor.transparentFully.cgColor
                        var translation = sender.translation(in: sender.view)
                        if(translation.x < translation.y )
                        {
                            translation.y = translation.x
                        }
                        else
                        {
                            translation.x = translation.y
                        }
                        layer?.path = ShapePath().rectangle(startPoint: startPoint, translationPoint: translation).cgPath
            
                    case Shapes.dash:
                        endPoint = sender.location(in: sender.view)
                
                        let arr :NSArray = NSArray(array: [10,5])
                
                        layer?.lineDashPattern = arr as? [NSNumber]
                        layer?.path = ShapePath().line(startPoint: startPoint, endPoint: endPoint).cgPath
                
                
                }
            }
            else
            {
                layer?.strokeColor = UIColor.white.cgColor
                endPoint = sender.location(in: sender.view)
                customPath?.move(to: startPoint)
                customPath?.addLine(to: endPoint)
                startPoint = endPoint
                customPath?.close()
                layer?.path = customPath?.cgPath
            }
            
        }
    }
    
    //select a color
    @IBAction func colorDidSelect(_ sender: UIButton) {
        erasing = false
        
        selectedFillColor = colorArray[sender.tag]
        selectedStrokeColor = colorArray[sender.tag]
    }
    
    //select a shape
    @IBAction func shapeDidSelect(_ sender: UIButton)
    {
        erasing = false
        selectedShape = shapeArray[sender.tag]
    }
}
