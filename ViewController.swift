//
//  ViewController.swift
//  Color Game
//
//  Created by Nicholas Kearns on 12/10/19.
//  Copyright © 2019 Nicholas Kearns. All rights reserved.
//

import UIKit






class ViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var score = 0
    
    
    
    
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
    
    
    @IBAction func yesButtonTapped(_ sender: Any) {
        
        
        //if yes is tapped and the correct answer is yes
        //increment score by 1
               
        
        if colorsMatch(){
            score += 1
        }
        else {
            score -= 1
        }
        updateLabels()
        
        
       
        
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        
        //if no is tapped and the correct answer is no
        //increment score by 1
        
        if colorsMatch() == false {
            score += 1
        }
        else {
            score -= 1
        }
        updateLabels()
        
    }
    
    
    func updateLabels() {
        
        
        //adding logic to be more accessible to people who are colorblind
        
        let colorText = colorToString(color: getRandomColor())
        let actualColorText = colorToString(color: getRandomColor())
        let actualColor = colorToUIColor(color: getRandomColor())
        
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
            colorLabel.textColor = actualColor
            colorLabel.text = actualColorText
            colorWordLabel.text = colorText
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    
    func colorsMatch() -> Bool {
        let colorOfLabel =  UIColorToString(color: colorLabel.textColor)
        print(colorOfLabel)
        print(colorWordLabel.text!)
        return colorOfLabel == colorWordLabel.text!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabels()

    }

    
    
    
    

}

