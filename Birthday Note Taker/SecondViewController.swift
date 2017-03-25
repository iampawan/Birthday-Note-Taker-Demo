//
//  SecondViewController.swift
//  Birthday Note Taker
//
//  Created by Pawan Kumar on 24/03/17.
//  Copyright © 2017 MTechViral. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var user = ""
    var counter = 10
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action:#selector(SecondViewController.timerSchedule))
        
        nameLabel.addGestureRecognizer(gesture)
      
    
        nameLabel.text = "Your name is : \(user)"

        // Do any additional setup after loading the view.
    }
    
    
    func timerSchedule(){
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(SecondViewController.timerFunction), userInfo: nil, repeats: true)
    }
    func timerFunction() {
        
        if counter == 0 {
            timer.invalidate()
            timerLabel.text = "Stopped on 0"
        }else{
        timerLabel.text = String(counter)
        counter -= 1
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
