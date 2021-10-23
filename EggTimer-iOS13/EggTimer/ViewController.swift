//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    var player: AVAudioPlayer?

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        //Set hardness and total time
        let hardness = sender.currentTitle! //Soft, Medium, Hard
        totalTime = eggTimes[hardness]! //* 60
        
        // Reset progress bar
        progressBar.progress = 0.0
        secondsPassed = 0
        
        //Reset timer label
        titleLabel.text = hardness
        
        // Reset timer
        timer.invalidate()
        
        // Start timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    // @objc komt van de taal objective-c --> Omdat de selector: #selector(updateCounter) uit objective-c komt
    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalTime {
            
            // Update seconden
            secondsPassed += 1
            
            // Zorg ervoor dat je de float conversie doet voordat je deelt of iets anders doet --> Anders gelijk aan 0
            let percentageProgress:Float = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
        
        } else {
            //Play alarm sound 
            playAlarmSound()
            //Stop timer and change title to "Done!"
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }

    func playAlarmSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
