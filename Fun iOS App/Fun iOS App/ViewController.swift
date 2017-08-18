//
//  ViewController.swift
//  Fun iOS App
//
//  Created by Nancy Zhang on 13/08/17.
//  Copyright © 2017 Nancy Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var theLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickingTheButton(_ sender: Any) {
        
        theLabel.text = "Clicked button"
        print("Hello, world!")
        
        let courseNameList = ["Christine", "Justin", "Adam", "Greg"]
        
        for name in courseNameList
        {
            if name == "Christine"
            {
                print("\(name) is a lecturer")
            }
            else
            {
                print("\(name) is a student")
            }
        }

    }

}

