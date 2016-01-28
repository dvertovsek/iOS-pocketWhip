//
//  ViewController.swift
//  PocketWhip
//
//  Created by MTLab on 28/01/16.
//  Copyright © 2016 dare. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var whipSound:SystemSoundID = 0
    
    var avPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let soundUrl = NSBundle.mainBundle().URLForResource("whip", withExtension: "wav")
        AudioServicesCreateSystemSoundID(soundUrl!, &whipSound)
        
        let indySoundUrl = NSBundle.mainBundle().URLForResource("indythemesong", withExtension: "mp3")
        
        do{
         try self.avPlayer = AVAudioPlayer.init(contentsOfURL: indySoundUrl!)
        } catch {
            print("failed to initialize audio player")
        }
        
        avPlayer.numberOfLoops = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake{
            if segmentController.selectedSegmentIndex == 0
            {
                AudioServicesPlaySystemSound(self.whipSound)
            }
            else if segmentController.selectedSegmentIndex == 1
            {
                AudioServicesPlaySystemSound(self.whipSound)
                self.avPlayer.play()
            }
            
        }
    }

}

