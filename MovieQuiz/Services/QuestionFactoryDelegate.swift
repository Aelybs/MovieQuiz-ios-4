//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Admin on 06.10.2025.
//

import Foundation
protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
