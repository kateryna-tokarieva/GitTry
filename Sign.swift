//
//  Sign.swift
//  RPS
//
//  Created by Екатерина Токарева on 21/09/2022.
//

import Foundation

func randomSigh () -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign: String {
    case rock = "👊"
    case paper = "✋"
    case scissors = "✌️"
    var description : String { return self.rawValue }
    func gameResult (_ oponent: Sign) -> GameState {
        switch oponent {
        case .rock:
            switch self {
            case .rock: return .draw
            case .paper: return .win
            case .scissors: return .lose
            }
        case .paper:
            switch self {
            case .rock: return .lose
            case .paper: return .draw
            case .scissors: return .win
            }
        case .scissors:
            switch self {
            case .rock: return .win
            case .paper: return .lose
            case .scissors: return .draw
            }
        }
    }
}

