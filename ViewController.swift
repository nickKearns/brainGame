//
//  ViewController.swift
//  Color Game
//
//  Created by Nicholas Kearns on 12/10/19.
//  Copyright © 2019 Nicholas Kearns. All rights reserved.
//

import UIKit






class ViewController: UIViewController {

    
    //make the connection to the labels and buttons
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var score = 0
    var isPlaying = false
    var gameOver = false
    
    
//    var timer: Timer?
    var timeLeft = 60
    
  
  
    func runTimer() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        
        //update the timer label text with time left
        //decrement timeLeft
        
        timerLabel.text = "Time left: \(timeLeft)"
        timeLeft -= 1
        
        
    }
    
    
    enum Color: String, CaseIterable {
        case blue
        case red
        case yellow
        case green
        case black
        case purple
        case orange
        
//
        
    }
    
    func colorToUIColor(color: Color) -> UIColor {
        switch color {
        case .blue: return UIColor.blue
        case .red: return UIColor.red
        case .yellow: return UIColor.yellow
        case .green: return UIColor.green
        case .black: return UIColor.black
        case .purple: return UIColor.purple
        case .orange: return UIColor.orange
        }
    }
    
    
    
    func UIColorToString(color: UIColor) -> String {
        switch color {
        case UIColor.blue: return "blue"
        case UIColor.red: return "red"
        case UIColor.yellow: return "yellow"
        case UIColor.green: return "green"
        case UIColor.black: return "black"
        case UIColor.purple: return "purple"
        case UIColor.orange: return "orange"
        default:
            return "no color"
            
        }
    }
    
    
    func colorToString(color: Color) -> String {
        switch color {
            case .blue: return "blue"
            case .red: return "red"
            case .yellow: return "yellow"
            case .green: return "green"
            case .black: return "black"
            case .purple: return "purple"
            case .orange: return "orange"
        }
    }

    
    
    func getRandomColor() -> ViewController.Color {
        //get a random color from the Color enum and return it
        return Color.allCases.randomElement()!
    }
    
    func showGameOver() {
        playButton.isHidden = false
        displayFinalScore()
        
        
    }
    
    func displayFinalScore() {
        
    }
    
    @IBAction func playButtontapped(_ sender: Any) {
        isPlaying = true
        playButton.isHidden = true
        runTimer()
        
        if timeLeft == 0 {
            gameOver = true
            showGameOver()
            
        }
        
        
    }
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        
        
        //if yes is tapped and the correct answer is yes
        //increment score by 1
        //if yes is tapped and the correct answer is no
        //decrement score by 1
        if isPlaying {
        
            if colorsMatch(){
                score += 1
            }
            else {
                score -= 1
            }
            playButton.isHidden = true
            updateLabels()
        }
        else {
            isPlaying = true
            playButton.isHidden = true
        }
        
       
        
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        
        //if no is tapped and the correct answer is no
        //increment score by 1
        //if no is tapped and the correct answer is yes
        //decrement the score by 1
        if isPlaying {
            if colorsMatch() == false {
                score += 1
            }
            else {
                score -= 1
            }
            playButton.isHidden = true
            updateLabels()
        }
        else {
            isPlaying = true
            playButton.isHidden = true
        }
    }
    
    
    
    func updateLabels() {
        
        
        //adding logic to be more accessible to people who are colorblind
        
        let colorText = colorToString(color: getRandomColor())
        let actualColorText = colorToString(color: getRandomColor())
        let actualColor = colorToUIColor(color: getRandomColor())
        
        
        
        // 3 color combinations that are not allowed to happen
        //
        
        if (colorText == "blue" && actualColor == UIColor.purple) || (colorText == "purple" && actualColor == UIColor.blue){
            updateLabels()
        }
        else if (colorText == "green" && actualColor == UIColor.red) || (colorText == "red" && actualColor == UIColor.green) {
            updateLabels()
        }
        else if (colorText == "orange" && actualColor == UIColor.yellow) || (colorText == "yellow" && actualColor == UIColor.orange) {
            updateLabels()
        }
        else {
            
            //set all the text colors and text of the two labels
            //and upate the score label
            
            colorLabel.textColor = actualColor
            colorLabel.text = actualColorText
            colorWordLabel.text = colorText
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    func colorsMatch() -> Bool {
        
        //return a bool, true if the colorWordLabel text matches the string version of the UIColor of the second word
        
        let colorOfLabel =  UIColorToString(color: colorLabel.textColor)
//        print(colorOfLabel)
//        print(colorWordLabel.text!)
        return colorOfLabel == colorWordLabel.text!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabels()
        

    }

    
    
    
    

}

