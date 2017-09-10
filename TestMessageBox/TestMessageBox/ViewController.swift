//
//  ViewController.swift
//  TestMessageBox
//
//  Created by Christine Jiang on 30/08/17.
//  Copyright © 2017 Christine Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func confirmDidTap(_ sender: Any)
    {
        let ctrl = UIAlertController(title: "", message: "Do you want to do this?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            self.dismiss(animated: true, completion: nil)
        }
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        ctrl.addAction(cancelAction)
        ctrl.addAction(okAction)
        self.present(ctrl, animated: true, completion: nil)
    }
    
    @IBAction func shouldKnowDidTap(_ sender: Any)
    {
        let ctrl = UIAlertController(title: "You should know this.", message: "Optional description text for this alert view.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        ctrl.addAction(okAction)
        self.present(ctrl, animated: true, completion: nil)
    }
    
    @IBAction func enterDidTap(_ sender: Any)
    {
        let ctrl = UIAlertController(title: "Enter Password", message: "To proceed, please enter your user name and password", preferredStyle: .alert)
        ctrl.addTextField { textField in
            textField.placeholder = "Enter your user name"
            textField.isAccessibilityElement = true
        }
        ctrl.addTextField { textField in
            textField.placeholder = "Enter your password"
            textField.isSecureTextEntry = true
            textField.isAccessibilityElement = true
        }
        let loginAction = UIAlertAction(title: "Login", style: .default) { action in
            
        }
        ctrl.addAction(loginAction)
        self.present(ctrl, animated: true, completion: nil)
    }
}

