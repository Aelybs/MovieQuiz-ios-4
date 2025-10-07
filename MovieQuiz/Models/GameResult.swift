import Foundation
struct GameResult {
    var correct: Int
    var total: Int
    var date: Date
    
    func isBetter(_ another: GameResult) {
        correct > another.correct
    }
}
