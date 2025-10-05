//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Admin on 03.10.2025.
//
import Foundation
class StatisticService {
    private enum Keys: String {
        case gamesCount
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case totalCorrectAnswers
        case totalQuestionAsked
    }
    private var storage: UserDefaults = .standard
    
     var totalCorrectAnswers: Int {
        get {
            UserDefaults.standard.integer(forKey: Keys.totalCorrectAnswers.rawValue)
        } set {
            UserDefaults.standard.set(newValue, forKey: Keys.totalCorrectAnswers.rawValue)
        }
    }
    private var totalQuestionAsked: Int  {
            get {
                storage.integer(forKey: Keys.totalQuestionAsked.rawValue)
            } set {
                storage.set(newValue, forKey: Keys.totalQuestionAsked.rawValue)
            }
        }

}
extension StatisticService: StatisticServiceProtocol {
        var gamesCount: Int {
            get {
                let gamesCount = storage.integer(forKey: Keys.gamesCount.rawValue)
                return gamesCount
    }
            set {
                storage.set(newValue, forKey: Keys.gamesCount.rawValue)
            }
        }
        
        var bestGame: GameResult {
            get {
                let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
                let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
                let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
                return GameResult(correct: correct, total: total, date: date)
                
            } set {
                storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
                storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
                storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
            }
        }
        var totalAccuracy: Double {
            let total = totalQuestionAsked
            guard total >  0 else { return 0 }
            return (Double(totalCorrectAnswers) / Double(totalQuestionAsked) * 100)
        }
 
        
    func store(correct count: Int, total amount: Int) {
        print("До store gamesCount = \(gamesCount)")
        totalQuestionAsked += amount
        totalCorrectAnswers += count
        
        let  newGame = GameResult(correct: count, total: amount, date: Date())
        if newGame.isBetter(bestGame) {
            bestGame = newGame
        }
   print("После стор \(gamesCount)")
    }
    }
