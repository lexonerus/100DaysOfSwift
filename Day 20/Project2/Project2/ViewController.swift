//
//  ViewController.swift
//  Project2
//
//  Created by Alex Krzywicki on 07.08.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Views
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var guessesLabel: UILabel!
    
    // MARK: Properties
    var countries = [String]()
    var score = 0
    var guess = 0
    var correctAnswer = Int.random(in: 0...2)
    
    // MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        askQuestion(action: nil)
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        guess += 1
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
            let ac = UIAlertController(title: "No, thi is \(countries[sender.tag].uppercased())", message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        
        if guess == 10 {
            let ac = UIAlertController(title: "10 guess is last.", message: "Your score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: askQuestion))
            present(ac, animated: true)
            return
        }

        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}

// MARK: Private methods
private extension ViewController {
    func configureAppearance() {
        fillArrayWithFlags()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    func fillArrayWithFlags() {
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
    }
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
        guessesLabel.text = "Number of guesses = \(guess)"
    }
}
