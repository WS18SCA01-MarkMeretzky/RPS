//
//  GameState.swift
//  RPS
//
//  Created by Mark Meretzky on 11/5/18.
//  Copyright © 2018 New York University School of Professional Studies. All rights reserved.
//

import Foundation;
import UIKit; //for UIColor

enum GameState {
    case start;
    case win;    //user wins
    case lose;   //user loses
    case draw;
    
    var string: String {
        switch self {
        case .start:
            return "Start";
        case .win:
            return "Win";
        case .lose:
            return "Lose";
        case .draw:
            return "Draw";
        }
    }
    
    var color: UIColor {
        switch self {
        case .start:
            return .white;
        case .win:
            return .green;
        case .lose:
            return .red;
        case .draw:
            return .gray;
        }
    }
}

