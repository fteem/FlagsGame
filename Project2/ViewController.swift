//
//  ViewController.swift
//  Project2
//
//  Created by Ilija Eftimov on 07/01/17.
//  Copyright © 2017 Ilija Eftimov. All rights reserved.
//

import GameplayKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var pointsLabel: UILabel!
    
    var countries = [
        "estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria",
        "poland", "russia", "spain", "uk", "us"
    ]
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
        } else {
            score -= 1
        }
        
        //let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        //ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        //present(ac, animated: true)
        pointsLabel.text = "Points: \(score)"
        askQuestion()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

