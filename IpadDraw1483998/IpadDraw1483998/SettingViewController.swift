//
//  SettingViewController.swift
//  IpadDraw1483998
//
//  Created by Nancy Zhang on 11/09/17.
//  Copyright © 2017 Nancy Zhang. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func enter(_ sender: Any) {
        if textField.text != ""
        {
            performSegue(withIdentifier: "segue", sender:self)
        }
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
      self.dismiss(animated: false)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewCtrl = segue.destination as! ViewController
        viewCtrl.mystring = textField.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
