//
//  RegisterViewController.swift
//  IpadDraw1483998
//
//  Created by Nancy Zhang on 15/09/17.
//  Copyright © 2017 Nancy Zhang. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    
    @IBAction func submitInfo(_ sender: Any) {
        if nameText.text != ""
        {
            let nameToSave = nameText.text
            //self.save(name:nameToSave!)
        }
    }
    
    @IBAction func dropClicked(_ sender: Any) {
        self.dismiss(animated: false)
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
