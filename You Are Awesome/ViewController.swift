//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Linda Chen on 9/5/17.
//  Copyright © 2017 Synestha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var message:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func random(max:Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
    
    
    @IBAction func buttonPressed( _ sender:UIButton){
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "Fabulous? That's You!",]
        

        var choice = -1
        repeat {
            choice = random(max:messages.count)
        } while message?.text == messages[choice]
        
        message?.text = messages[choice]
        
    }
    
 

}

