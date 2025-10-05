//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Admin on 03.10.2025.
//

import Foundation
struct GameResult {
    var correct: Int
    var total: Int
    var date: Date
    
    func isBetter(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
