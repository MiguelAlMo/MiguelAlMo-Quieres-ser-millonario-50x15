//
//  ViewController.swift
//  _50 x 15_
//
//  Created by Miguel Alarcon on 9/6/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Views
    @IBOutlet weak var premiosView: UIView!
    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var numberOfQuestion: UIView!
    @IBOutlet weak var viewComodines: UIView!
    @IBOutlet weak var answerA: UIView!
    @IBOutlet weak var answerB: UIView!
    @IBOutlet weak var answerC: UIView!
    @IBOutlet weak var answerD: UIView!
    @IBOutlet weak var timeView: UIView!
    
    //MARK: - Labels
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var leterAlabel: UILabel!
    @IBOutlet weak var leterBlabel: UILabel!
    @IBOutlet weak var leterClabel: UILabel!
    @IBOutlet weak var leterDlabel: UILabel!
    @IBOutlet weak var numberOfQuestionLabel: UILabel!
    
    @IBOutlet weak var questionPremio1: UILabel!
    @IBOutlet weak var questionPremio2: UILabel!
    @IBOutlet weak var questionPremio3: UILabel!
    @IBOutlet weak var questionPremio4: UILabel!
    @IBOutlet weak var questionPremio5: UILabel!
    @IBOutlet weak var questionPremio6: UILabel!
    @IBOutlet weak var questionPremio7: UILabel!
    @IBOutlet weak var questionPremio8: UILabel!
    @IBOutlet weak var questionPremio9: UILabel!
    @IBOutlet weak var questionPremio10: UILabel!
    @IBOutlet weak var questionPremio11: UILabel!
    @IBOutlet weak var questionPremio12: UILabel!
    @IBOutlet weak var questionPremio13: UILabel!
    @IBOutlet weak var questionPremio14: UILabel!
    @IBOutlet weak var questionPremio15: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //MARK: - Buttons
    @IBOutlet weak var buttonAnswerA: UIButton!
    @IBOutlet weak var buttonAnswerB: UIButton!
    @IBOutlet weak var buttonAnswerC: UIButton!
    @IBOutlet weak var buttonAnswerD: UIButton!
    @IBOutlet weak var buttonComodin50_50: UIButton!
    @IBOutlet weak var buttonComodin25_75: UIButton!
    
    var timeSeconds = 60
    var questionEasy = defaultQuestionsEasy.randomElement()
    var counter = 1 {
        didSet {
            switch counter {
                case 1: questionPremio1.backgroundColor = .black
                case 2: questionPremio1.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio1.flashLabel(numberOfFlashes: 3)
                case 3: questionPremio2.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio2.flashLabel(numberOfFlashes: 3)
                case 4: questionPremio3.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio3.flashLabel(numberOfFlashes: 3)
                case 5: questionPremio4.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio4.flashLabel(numberOfFlashes: 3)
                case 6: questionPremio5.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio5.flashLabel(numberOfFlashes: 3)
                case 7: questionPremio6.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio6.flashLabel(numberOfFlashes: 3)
                case 8: questionPremio7.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio7.flashLabel(numberOfFlashes: 3)
                case 9: questionPremio8.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio8.flashLabel(numberOfFlashes: 3)
                case 10: questionPremio9.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio9.flashLabel(numberOfFlashes: 3)
                case 11: questionPremio10.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio10.flashLabel(numberOfFlashes: 3)
                case 12: questionPremio11.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio11.flashLabel(numberOfFlashes: 3)
                case 13: questionPremio12.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio12.flashLabel(numberOfFlashes: 3)
                case 14: questionPremio13.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio13.flashLabel(numberOfFlashes: 3)
                case 15: questionPremio14.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio14.flashLabel(numberOfFlashes: 3)
                case 16: questionPremio15.backgroundColor = .cyan.withAlphaComponent(0.5)
                    questionPremio15.flashLabel(numberOfFlashes: 3)
                default: break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 1
        leterAlabel.text = "A:"
        leterBlabel.text = "B:"
        leterClabel.text = "C:"
        leterDlabel.text = "D:"
        
        timerFunc(label: timeLabel)
        
        premiosView.roundedView(value: 20)
        premiosView.borderColor(value: 1, color: .white)
        
        questionView.roundedView(value: 20)
        questionView.borderColor(value: 1, color: .white)
        
        numberOfQuestion.roundedView(value: 12)
        numberOfQuestion.borderColor(value: 1, color: .white)
        
        viewComodines.roundedView(value: 12)
        viewComodines.borderColor(value: 1, color: .white)
        
        buttonComodin50_50.roundedButton(value: 12)
        buttonComodin50_50.borderColorButton(value: 1, color: .white)
        
        buttonComodin25_75.roundedButton(value: 12)
        buttonComodin25_75.borderColorButton(value: 1, color: .white)
        
        timeView.roundedView(value: 50)
        timeView.borderColor(value: 1, color: .white)
        
        answerA.roundedView(value: 20)
        answerA.borderColor(value: 1, color: .white)
        
        answerB.roundedView(value: 20)
        answerB.borderColor(value: 1, color: .white)
        
        answerC.roundedView(value: 20)
        answerC.borderColor(value: 1, color: .white)
        
        answerD.roundedView(value: 20)
        answerD.borderColor(value: 1, color: .white)
        
        setNewQuestion()
        audioPlayer.stop()
        soundHome(titleSong: "Musica_preguntas")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        timer?.invalidate()
    }
    
    public func showAlert(message: String) {
        let alert = UIAlertController(title: "Pregunta \(counter)", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self]_ in setNewQuestion()
            soundHome(titleSong: "Musica_preguntas")
            buttonAnswerA.setTitleColor(.white, for: .normal)
            buttonAnswerB.setTitleColor(.white, for: .normal)
            buttonAnswerC.setTitleColor(.white, for: .normal)
            buttonAnswerD.setTitleColor(.white, for: .normal)
            timerFunc(label: timeLabel)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    public func showAlertError(message: String) {
        let alert = UIAlertController(title: "Fin de la partida", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self]_ in performSegue(withIdentifier: "VOLVER_A_EMPEZAR", sender: nil)}))
        present(alert, animated: true, completion: nil)
    }
    
    func setNewQuestion() {
        questionEasy = defaultQuestionsEasy.randomElement()
        questionLabel.text = questionEasy?.question
        buttonAnswerA.setTitle(questionEasy?.options?[0], for: .normal)
        buttonAnswerB.setTitle(questionEasy?.options?[1], for: .normal)
        buttonAnswerC.setTitle(questionEasy?.options?[2], for: .normal)
        buttonAnswerD.setTitle(questionEasy?.options?[3], for: .normal)
        answerA.backgroundColor = .black
        answerB.backgroundColor = .black
        answerC.backgroundColor = .black
        answerD.backgroundColor = .black
    }
    
    //MARK: - Actions
    
    @IBAction func actionComodin50_50(_ sender: Any) {
        if leterAlabel.text == questionEasy?.answer {
            buttonAnswerB.setTitle("", for: .normal)
            buttonAnswerC.setTitle("", for: .normal)
        }
        if leterBlabel.text == questionEasy?.answer {
            buttonAnswerA.setTitle("", for: .normal)
            buttonAnswerC.setTitle("", for: .normal)
        }
        if leterClabel.text == questionEasy?.answer {
            buttonAnswerA.setTitle("", for: .normal)
            buttonAnswerD.setTitle("", for: .normal)
        }
        if leterDlabel.text == questionEasy?.answer {
            buttonAnswerA.setTitle("", for: .normal)
            buttonAnswerB.setTitle("", for: .normal)
        }
        buttonComodin50_50.backgroundColor = .gray.withAlphaComponent(0.5)
        
    }
    @IBAction func actionComodin25_75(_ sender: Any) {
        if leterAlabel.text == questionEasy?.answer {
            buttonAnswerC.setTitle("", for: .normal)
        }
        if leterBlabel.text == questionEasy?.answer {
            buttonAnswerD.setTitle("", for: .normal)
        }
        if leterClabel.text == questionEasy?.answer {
            buttonAnswerA.setTitle("", for: .normal)
        }
        if leterDlabel.text == questionEasy?.answer {
            buttonAnswerB.setTitle("", for: .normal)
        }
        buttonComodin25_75.backgroundColor = .gray.withAlphaComponent(0.5)
    }
    
    
    
    @IBAction func actionAnswerA(_ sender: Any) {
        
        if counter < 15{
            if leterAlabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerA.flashView(numberOfFlashes: 3)
                    self.buttonAnswerA.setTitleColor(.black, for: .normal)
                    self.answerA.backgroundColor = .cyan.withAlphaComponent(0.6)
                    self.showAlert(message: "Correcto!!!")
                    self.counter += 1
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerA.flashView(numberOfFlashes: 3)
                    self.answerA.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
        } else {
            if leterAlabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerA.flashView(numberOfFlashes: 3)
                    self.buttonAnswerA.setTitleColor(.black, for: .normal)
                    self.questionPremio15.backgroundColor = .cyan.withAlphaComponent(0.5)
                    self.showAlertError(message: "\nFelicidades!!!\n\nHas acertado las 15 preguntas!!")
                    self.answerA.backgroundColor = .cyan.withAlphaComponent(0.6)
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerA.flashView(numberOfFlashes: 3)
                    self.answerA.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
            
        }
        
    }
    @IBAction func actionAnswerB(_ sender: Any) {
        if counter < 15{
            if leterBlabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerB.flashView(numberOfFlashes: 3)
                    self.buttonAnswerB.setTitleColor(.black, for: .normal)
                    self.answerB.backgroundColor = .cyan.withAlphaComponent(0.6)
                    self.showAlert(message: "Correcto!!!")
                    self.counter += 1
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerB.flashView(numberOfFlashes: 3)
                    self.answerB.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
        } else {
            if leterBlabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerB.flashView(numberOfFlashes: 3)
                    self.buttonAnswerB.setTitleColor(.black, for: .normal)
                    self.questionPremio15.backgroundColor = .cyan.withAlphaComponent(0.5)
                    self.showAlertError(message: "\nFelicidades!!!\n\nHas acertado las 15 preguntas!!")
                    self.answerB.backgroundColor = .cyan.withAlphaComponent(0.6)
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerB.flashView(numberOfFlashes: 3)
                    self.answerB.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
            
        }
        
    }
    @IBAction func actionAnswerC(_ sender: Any) {
        if counter < 15{
            if leterClabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerC.flashView(numberOfFlashes: 3)
                    self.buttonAnswerC.setTitleColor(.black, for: .normal)
                    self.answerC.backgroundColor = .cyan.withAlphaComponent(0.6)
                    self.showAlert(message: "Correcto!!!")
                    self.counter += 1
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerC.flashView(numberOfFlashes: 3)
                    self.answerC.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
        } else {
            if leterClabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerC.flashView(numberOfFlashes: 3)
                    self.buttonAnswerC.setTitleColor(.black, for: .normal)
                    self.questionPremio15.backgroundColor = .cyan.withAlphaComponent(0.5)
                    self.showAlertError(message: "\nFelicidades!!!\n\nHas acertado las 15 preguntas!!")
                    self.answerC.backgroundColor = .cyan.withAlphaComponent(0.6)
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerC.flashView(numberOfFlashes: 3)
                    self.answerC.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
            
        }
        
    }
    @IBAction func actionAnswerD(_ sender: Any) {
        
        if counter < 15{
            if leterDlabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerD.flashView(numberOfFlashes: 3)
                    self.buttonAnswerD.setTitleColor(.black, for: .normal)
                    self.answerD.backgroundColor = .cyan.withAlphaComponent(0.6)
                    self.showAlert(message: "Correcto!!!")
                    self.counter += 1
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerD.flashView(numberOfFlashes: 3)
                    self.answerD.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
        } else {
            if leterDlabel.text == questionEasy?.answer {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_correcta")
                delayWithSeconds(0.7){
                    self.answerD.flashView(numberOfFlashes: 3)
                    self.buttonAnswerD.setTitleColor(.black, for: .normal)
                    self.questionPremio15.backgroundColor = .cyan.withAlphaComponent(0.5)
                    self.showAlertError(message: "\nFelicidades!!!\n\nHas acertado las 15 preguntas!!")
                    self.answerD.backgroundColor = .cyan.withAlphaComponent(0.6)
                }
            } else {
                audioPlayer.stop()
                soundHome(titleSong: "Respuesta_incorrecta")
                delayWithSeconds(0.7){
                    self.answerD.flashView(numberOfFlashes: 3)
                    self.answerD.backgroundColor = .red.withAlphaComponent(0.9)
                    self.showAlertError(message: "La respuesta correcta era \( self.questionEasy?.answer?.first?.debugDescription ?? "")\n \nHas acertado \(self.counter - 1) preguntas!!")
                    self.numberOfQuestionLabel.text = "Pregunta \(self.counter)"
                }
                
            }
            
        }
    }
    
}

