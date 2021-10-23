//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    //Creating an instance of StoryBrain
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set starting text for label and buttons
        storyLabel.text = storyBrain.stories[0].title
        choice1Button.setTitle(storyBrain.stories[0].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[0].choice2, for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        var questionNumer = storyBrain.nextStory(userAnswer: sender.currentTitle!)
        updateUI(qn: questionNumer)
    }
    
    func updateUI(qn questionNumber:Int){
        storyLabel.text = storyBrain.stories[questionNumber].title
        choice1Button.setTitle(storyBrain.stories[questionNumber].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.stories[questionNumber].choice2, for: .normal)
    }
    
}

