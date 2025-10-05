//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Admin on 03.10.2025.
//

import Foundation
protocol StatisticServiceProtocol {
    var gamesCount: Int { get set }
    var bestGame: GameResult { get set }
    var totalAccuracy: Double { get }
    
    func store( correct count: Int, total amount: Int)
}

