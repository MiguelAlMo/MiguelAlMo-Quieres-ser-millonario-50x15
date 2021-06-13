//
//  actionButton.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 12/6/21.
//

import UIKit
import AVFoundation

var counter = 1

func actionButton(labelquestion: UILabel, question: Question, answerView: UIView, buttonAnswer: UIButton, showAlert: UIAlertAction, showAlertError: UIAlertAction, numberOfQuestionLabel: UILabel, questionPremio15: UILabel ) {
    if counter < 15{
        if labelquestion.text == question.answer {
            audioPlayer.stop()
            soundHome(titleSong: "Respuesta_correcta")
            delayWithSeconds(0.7){
                answerView.flashView(numberOfFlashes: 3)
                buttonAnswer.setTitleColor(.black, for: .normal)
                answerView.backgroundColor = .cyan.withAlphaComponent(0.6)
                
                counter += 1
                numberOfQuestionLabel.text = "Pregunta \(counter)"
            }
        } else {
            audioPlayer.stop()
            soundHome(titleSong: "Respuesta_incorrecta")
            delayWithSeconds(0.7){
                answerView.flashView(numberOfFlashes: 3)
                answerView.backgroundColor = .red.withAlphaComponent(0.9)
                showAlertError
            }
            
        }
    } else {
        if labelquestion.text == question.answer {
            audioPlayer.stop()
            soundHome(titleSong: "Respuesta_correcta")
            delayWithSeconds(0.7){
                answerView.flashView(numberOfFlashes: 3)
                buttonAnswer.setTitleColor(.black, for: .normal)
                questionPremio15.backgroundColor = .cyan.withAlphaComponent(0.5)
                showAlertError
                answerView.backgroundColor = .cyan.withAlphaComponent(0.6)
            }
        } else {
            audioPlayer.stop()
            soundHome(titleSong: "Respuesta_incorrecta")
            delayWithSeconds(0.7){
                answerView.flashView(numberOfFlashes: 3)
                answerView.backgroundColor = .red.withAlphaComponent(0.9)
                showAlertError
            }
            
        }
        
    }


}
