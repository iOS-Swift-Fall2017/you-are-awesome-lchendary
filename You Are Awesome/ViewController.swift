//
//  ViewController.swift
//  You Are Awesome
//
//  Created by Linda Chen on 9/5/17.
//  Copyright © 2017 Synestha. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var message:UILabel?
    @IBOutlet weak var awesomeImage:UIImageView?
    @IBOutlet weak var playSoundSwitch:UISwitch?
    
    var lastMessage = -1
    var lastImage = -1
    var lastSound = -1
    var awesomePlayer = AVAudioPlayer()
    
    let messages = ["You Are Fantastic!",
                    "You Are Great!",
                    "You Are Amazing!",
                    "Fabulous? That's You!",
                    "You are the bomb!",
                    "I love you."]
    
    let images = ["image0",
                  "image1",
                  "image2",
                  "image3"]
    
    let sounds = ["sound0",
                  "sound1",
                  "sound2",
                  "sound3",
                  "sound4"]
    
    
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
    
    func RNG(lastNumber: Int, maxConstraint: Int)-> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxConstraint)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        
        // Is it possible to load in the sound file?
        if let sound = NSDataAsset(name: soundName) {
            
            // check if sound.data is a usable file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                
                // if sound.data is not a valid audio file
                print("ERROR: file \(soundName) didn't load.")
            }
        } else {
            // if reading the assets folder didn't work
            print("ERROR: file \(soundName) didn't load.")
        }
        
    }
    
    @IBAction func switchChanged( _ sender:UISwitch){
        if (!(playSoundSwitch?.isOn)! && lastSound != -1){
                awesomePlayer.stop()
        }
    }
    
    
    @IBAction func buttonPressed( _ sender:UIButton){

        //Message
        lastMessage = RNG(lastNumber: lastMessage, maxConstraint: messages.count)
        message?.text = messages[lastMessage]
        
        //Image
        lastImage = RNG(lastNumber: lastImage, maxConstraint: images.count)
        awesomeImage?.image = UIImage(named: images[lastImage])
        
        //Pick Sound
        lastSound = RNG(lastNumber: lastSound, maxConstraint: sounds.count)
        
        //Play sound
        let soundName = sounds[lastSound]
        if (playSoundSwitch?.isOn)! {
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
    }

}

