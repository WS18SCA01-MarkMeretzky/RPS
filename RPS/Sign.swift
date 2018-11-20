//
//  Sign.swift
//  RPS
//
//  Created by Mark Meretzky on 11/5/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import Foundation;
import GameplayKit;   //for GKRandomDistribution

enum Sign {
    case rock;
    case paper;
    case scissors;
    
    var emoji: String {
    	switch self {
    		case .rock:
    			return "👊";
    		case .paper:
    			return "✋";
    		case .scissors:
    			return "✌️";
    	}
    }
    
    //self is the user's sign, another is the app's sign.
    
    func compareTo(_ another: Sign) -> GameState {
        if self == another {
            return .draw;
        }
        
        if self == .rock && another == .paper          //Paper covers rock.
            || self == .paper && another == .scissors  //Scissors cuts paper.
            || self == .scissors && another == .rock { //Rock smashes scissors.
            return .lose;  //user has lost, app has won
        }
        
        return .win;       //user has won, app has lost
    }
}

let randomChoice: GKRandomDistribution = GKRandomDistribution(lowestValue: 0, highestValue: 2);

func randomSign() -> Sign {
    let sign: Int = randomChoice.nextInt();
    if sign == 0 {
        return .rock;
    } else if sign == 1 {
        return .paper;
    } else {
        return .scissors;
    }
}
