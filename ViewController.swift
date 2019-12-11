//
//  ViewController.swift
//  Color Game
//
//  Created by Nicholas Kearns on 12/10/19.
//  Copyright © 2019 Nicholas Kearns. All rights reserved.
//

import UIKit






class ViewController: UIViewController {

    
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var colorWordLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    var score = 0
    
    
    
    
    enum Color: CaseIterable {
        case blue
        case red
        case yellow
        case green
        case black
        case purple
        case orange
    }
    
    func colorToUIColor(color: Color) ->UIColor {
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
        
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        
        //if no is tapped and the correct answer is no
        //increment score by 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorLabel.textColor = colorToUIColor(color: getRandomColor())

    }

    
    
    
    

}

