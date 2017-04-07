//
//  ViewController.swift
//  retroCalculator
//
//  Created by Turcu Ciprian on 07/04/2017.
//  Copyright © 2017 Turcu Ciprian. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //counter label
    @IBOutlet weak var outputLabel: UILabel!
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        do{
            
         try btnSound = AVAudioPlayer(contentsOf: soundUrl)
            btnSound.prepareToPlay()
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
    }
    @IBAction func numberPressed (sender: UIButton){
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        
    }
    
    func playSound(){
        if btnSound.isPlaying {
            btnSound.stop()
        }else{
            btnSound.play()
        }
    }

}

