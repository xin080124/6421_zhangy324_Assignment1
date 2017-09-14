//
//  SettingViewController.swift
//  IpadDraw1483998
//
//  Created by Nancy Zhang on 11/09/17.
//  Copyright © 2017 Nancy Zhang. All rights reserved.
//

import UIKit
import CoreData

class SettingViewController: UIViewController {

    var people: [NSManagedObject] = []
    
    @IBAction func deleteClicked(_ sender: Any) {
        //people.remove(at: 0)
        
        //print(pCount)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        var predicable = NSPredicate(format: "name contains[c] %@" , "h")
        fetchRequest.predicate = predicable
        
        /* filter
        do {
            people = try managedContext.fetch(fetchRequest)
            let pCount = people.count
            
            for i in 0  ..< pCount
            {
                print(i)
                print("*************deleteClicked")
                let person = people[i]
                let value = person.value(forKeyPath: "name") as? String
                let ageValue = person.value(forKeyPath: "age") as? String
                print(value)
                print(ageValue)
                //print(" name = "+(value?)!+" age = "+(ageValue?)!)
                print("eeeeeeeeeeeeeeee")
            }
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        */
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
        do{
            print("deletig searched contents")
            try managedContext.execute(deleteRequest)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func enter(_ sender: Any) {
        if textField.text != ""
        {
            performSegue(withIdentifier: "segue", sender:self)
            
            let nameToSave = textField.text
            self.save(name:nameToSave!)
        }
        
    }
    
    func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person",
                                                in: managedContext)!
        print("sssssssssssssssssss")
        //print(entity)
        
        let person = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        print("sssssssssssssssssss")
        //print(person)
        
        person.setValue(name, forKeyPath: "name")
        person.setValue("agevalue", forKeyPath: "age")
        
        do {
            try managedContext.save()
            people.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
 
        
        ppppppppp()
        
    }
    
    func ppppppppp() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try managedContext.fetch(fetchRequest)
            
            let pCount = people.count
            print(pCount)

            for i in 0  ..< pCount
            {
                print(i)
                print("*************name")
                let person = people[i]
                let value = person.value(forKeyPath: "name") as? String
                let ageValue = person.value(forKeyPath: "age") as? String
                print(value)
                print(ageValue)
                //print(" name = "+(value?)!+" age = "+(ageValue?)!)
                print("^^^^^^^^^^^^^^")
            }
            print("pppppppppppppppp")
            //print(people)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        do {
            people = try managedContext.fetch(fetchRequest)
            print("pppppppppppppppp")
            //print(people)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
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
