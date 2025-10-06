//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Admin on 06.10.2025.
//

import Foundation
struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
}
