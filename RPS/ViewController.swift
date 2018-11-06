//
//  ViewController.swift
//  RPS
//
//  Created by Mark Meretzky on 11/5/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateTo(gameState: .start);
    }
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(sign: .rock);
    }
    
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(sign: .paper);
    }
    
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(sign: .scissors);
    }
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        updateTo(gameState: .start);
    }
    
    func play(sign userSign: Sign) {
        let appSignEnum: Sign = randomSign();   //the app's choice
        let gameState: GameState = userSign.compareTo(appSignEnum);
        updateTo(gameState: gameState);
        appSign.text = appSignEnum.emoji;
        
        //The user has just pressed a button.  Don't let him press again
        //until after he has pressed Play Again.
        rockButton.isEnabled = false;
        paperButton.isEnabled = false;
        scissorsButton.isEnabled = false;
        
        //Hide all the buttons except the one the user pressed.
        rockButton.isHidden = userSign != .rock;
        paperButton.isHidden = userSign != .paper;
        scissorsButton.isHidden = userSign != .scissors;
        
        playAgainButton.isHidden = false;
    }
    
    func updateTo(gameState: GameState) {
        gameStatus.text = gameState.string;
		view.backgroundColor = gameState.color;
        
        if gameState == .start {
            appSign.text = "🤖";
            playAgainButton.isHidden = true;
            
            rockButton.isEnabled = true;
            paperButton.isEnabled = true;
            scissorsButton.isEnabled = true;
            
            rockButton.isHidden = false;
            paperButton.isHidden = false;
            scissorsButton.isHidden = false;
        }
    }

}
