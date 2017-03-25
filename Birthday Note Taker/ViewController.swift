//
//  ViewController.swift
//  Birthday Note Taker
//
//  Created by Pawan Kumar on 24/03/17.
//  Copyright © 2017 MTechViral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var dateText: UITextField!
    
    @IBOutlet weak var storedName: UILabel!
    @IBOutlet weak var storedDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let savedName = UserDefaults.standard.object(forKey: "name")
        let savedDate = UserDefaults.standard.object(forKey: "date")

        if let newName = savedName as? String{
             storedName.text = "Stored name : \(newName)"
        }
        if let newDate = savedDate as? String{
            storedDate.text = "Stored date : \(newDate)"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "firstsegue"{
            let destinationVC = segue.destination as? SecondViewController
            destinationVC?.user = nameText.text!
        }
    }

    @IBAction func moveToBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Your Name is", message: nameText.text, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
            self.go()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)

        
    }
    
    func go(){
        performSegue(withIdentifier: "firstsegue", sender: nil)
    }
    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text, forKey: "name")
        UserDefaults.standard.set(dateText.text, forKey: "date")
        UserDefaults.standard.synchronize()

        storedName.text = "Stored name : \(nameText.text!)"
        storedDate.text = "Stored date : \(dateText.text!)"
    }
    @IBAction func deleteClicked(_ sender: Any) {
        let savedName = UserDefaults.standard.object(forKey: "name")
        let savedDate = UserDefaults.standard.object(forKey: "date")
        
        if let _ = savedName as? String{
            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            storedName.text = "Stored name : "
        }
        if let _ = savedDate as? String{
            UserDefaults.standard.removeObject(forKey: "date")
            UserDefaults.standard.synchronize()
            storedDate.text = "Stored date : "

        }
    }
    

}

