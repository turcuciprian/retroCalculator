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
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Substract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    

    
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
        
        outputLabel.text = "0"
    }
    @IBAction func numberPressed (sender: UIButton){
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed (sender: AnyObject){
        processOperation(operation: .Divide)
    }
    @IBAction func onMultiplyPressed (sender: AnyObject){
        processOperation(operation: .Multiply)
    }
    @IBAction func onSubstractPressed (sender: AnyObject){
        processOperation(operation: .Substract)
    }
    @IBAction func onAddPressed (sender: AnyObject){
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: AnyObject){
        //processOperation(operation: currentOperation)
    }
    
    func playSound(){
        if btnSound.isPlaying {
            btnSound.stop()
        }else{
            btnSound.play()
        }
    }
    func processOperation(operation: Operation){
        playSound()
        if currentOperation != Operation.Empty{
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = " \(Double(leftValStr)! * Double(rightValStr)!)"
                }else if currentOperation == Operation.Divide{
                    result = " \(Double(leftValStr)! / Double(rightValStr)!)"
                }else if currentOperation == Operation.Substract{
                    result = " \(Double(leftValStr)! - Double(rightValStr)!)"
                }else if currentOperation == Operation.Add{
                    result = " \(Double(leftValStr)! + Double(rightValStr)!)"
                }
                leftValStr = result
                outputLabel.text = result
        }
            currentOperation = operation
        } else{
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

}

