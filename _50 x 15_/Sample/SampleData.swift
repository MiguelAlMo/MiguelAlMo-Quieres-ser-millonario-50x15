//
//  SampleData.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 10/6/21.
//

import Foundation


// ******* DEFAULT DATA *******
var defaultQuestionsEasy: [Question] = []

func loadDefaultData() {
    loadQuestionsEasy()
}

// ******* LOAD JSON DATA *******
private func loadQuestionsEasy() {
    guard let pathURL = Bundle.main.url(forResource: "Question", withExtension: "json") else {
        print("Can not find `QuestionEasy` resource")
        return
    }
    
    do {
        let data = try Data(contentsOf: pathURL)
        defaultQuestionsEasy = try JSONDecoder().decode([Question].self, from: data)
    } catch {
        print("Can not find `QuestionEasy` resource")
    }
}
