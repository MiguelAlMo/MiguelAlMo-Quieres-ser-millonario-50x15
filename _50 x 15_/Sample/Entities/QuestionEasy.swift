//
//  QuestionEasy.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 10/6/21.
//
import UIKit

// MARK: - Question Easy

class Question: Codable {
    let question: String?
    let options: [String]?
    let answer: String?

    init(question: String?, options: [String]?, answer: String?) {
        self.question = question
        self.options = options
        self.answer = answer
    }
}
