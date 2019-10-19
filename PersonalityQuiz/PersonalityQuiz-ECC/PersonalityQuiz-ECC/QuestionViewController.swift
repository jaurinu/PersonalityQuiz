//
//  QuestionViewController.swift
//  PersonalityQuiz-ECC
//
//  Created by Apple Device 9 on 10/12/19.
//  Copyright © 2019 Squad-Dios. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    

    
    var questions = [
        Question(text: "pregunta 1", type: .single, answers:[
            Answer(text: "Respuesta1.1", type: .front),
            Answer(text: "Respuesta1.2", type: .back),
            Answer(text: "Respuesta1.3", type: .fullstack)
            ]),
        Question(text: "pregunta 2", type: .multiple, answers:[
            Answer(text: "Respuesta2.1", type: .front),
            Answer(text: "Respuesta2.2", type: .back),
            Answer(text: "Respuesta2.3", type: .fullstack)
            ]),
        Question(text: "pregunta 3", type: .ranged, answers:[
            Answer(text: "Respuesta3.1", type: .front),
            Answer(text: "Respuesta3.2", type: .back),
            Answer(text: "Respuesta3.3", type: .fullstack)
            ]),
    ]
    
    var questionIndex = 0
    
    func updateUI()  {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title="Question #\(questionIndex + 1)"
        
        let accesQuestion = questions[questionIndex]
        print(accesQuestion)
        
        switch accesQuestion.type {
        case .single:
            singleStackView.isHidden = false
//            updateSingleStack(using: [Answer(text: , type: )])
           
        case .multiple:
            multipleStackView.isHidden = false
           updateMultipleStack(using: <#T##[Answer]#>)
        case .ranged:
            rangedStackView.isHidden = false
            updateRangedStack(using: <#T##[Answer]#>)
        }
        
        questionLabel.text = accesQuestion.text
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        let currentAnswers = accesQuestion.answers
       
    }
    


func updateSingleStack(using answers: [Answer]) {
    singleStackView.isHidden = false
    singleButton1.setTitle(answers[0].text, for: .normal)
    singleButton2.setTitle(answers[1].text, for: .normal)
    singleButton3.setTitle(answers[2].text, for: .normal)
    singleButton4.setTitle(answers[3].text, for: .normal)
}

func updateMultipleStack(using answers: [Answer]) {
   multipleStackView.isHidden = false
    multiSwitch1.isOn = false
    multiSwitch2.isOn = false
    multiSwitch3.isOn = false
    multiSwitch4.isOn = false
    multiLabel1.text = answers[0].text
    multiLabel2.text = answers[1].text
    multiLabel3.text = answers[2].text
    multiLabel4.text = answers[3].text
}

func updateRangedStack(using answers: [Answer]) {
    rangedStackView.isHidden = false
    rangedSlider.setValue(0.5, animated: false)
    rangedLabel1.text = answers.first?.text
    rangedLabel2.text = answers.last?.text
}

var answersChosen: [Answer] = []

    
    @IBAction func singleButton1(_ sender: Any) {
    }
    
    @IBAction func singleButton2(_ sender: Any) {
    }
    
    @IBAction func singleButton3(_ sender: Any) {
    }
    
    @IBAction func singleButton4(_ sender: Any) {
    }
    

    @IBAction func singleAnswerButtonClicked(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }

}

