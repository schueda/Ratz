//
//  TestViewController.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import UIKit

class TestViewController: UIViewController {
    var testData = TestRound.rounds
    
    @IBOutlet weak var mistakesLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var lastButton: UIButton!
    var buttons: [UIButton] = []
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var index = 0
    var greatestIndex = 0
    
    var mistakes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttons = [firstButton, secondButton, thirdButton, lastButton]
        
        for button in buttons {
            setupButton(button)
        }
        
        setupNavigationButton(previousButton)
        setupNavigationButton(nextButton)
        
        changeRoundData(index: index)
        
    }
    
    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
        
        button.layer.shadowColor = UIColor(named: "shadowzinha")?.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.isEnabled = true
        
    }
    
    func setupNavigationButton(_ button: UIButton) {
        button.layer.cornerRadius = 5
        
        button.layer.shadowColor = UIColor(named: "shadowzinha")?.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        disableButton(button)
    }
    
    func ableButton(_ button: UIButton) {
        button.isEnabled = true
        button.alpha = 1
    }
    
    func disableButton(_ button: UIButton) {
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    func changeRoundData(index: Int) {
        let round = testData[index]
        questionLabel.text = round.question
        
        for (index, button) in buttons.enumerated() {
            resetButton(button, buttonIndex: index)
            if testData[self.index].answers[index].selected == true {
                changeButton(button, buttonIndex: index)
            } else {
                button.isEnabled = greatestIndex == self.index
            }
        }
        
        if index > 0 {
            ableButton(previousButton)
        }
        
        progressBar.progress = Float(index)/Float(testData.count)
    }
    
    func resetButton(_ button: UIButton, buttonIndex: Int) {
        let round = testData[index]
        
        button.setTitle(round.answers[buttonIndex].text, for: .normal)
        button.isEnabled = true
        button.layer.backgroundColor = UIColor(named: "verdinho")?.cgColor
        button.setTitleColor(UIColor(named: "texto"), for: .normal)
    }
    
    func changeButton(_ button: UIButton, buttonIndex: Int, buttonClicked: Bool = false) {
        testData[index].answers[buttonIndex].selected = true
        
        if testData[index].answers[buttonIndex].correct == false {
            if buttonClicked {
                mistakes += 1
                mistakesLabel.text = "erros: \(mistakes)"
            }
            button.layer.backgroundColor = UIColor(named: "mistake")?.cgColor
            button.isEnabled = false
            button.setTitleColor(UIColor(named: "verdinho") ?? UIColor.black, for: .normal)
        } else {
            button.layer.backgroundColor = UIColor(named: "verdeMaisForte")?.cgColor
            button.setTitleColor(UIColor(named: "verdinho") ?? UIColor.black, for: .normal)
            ableButton(nextButton)
            for button in buttons {
                button.isEnabled = false
            }
            
        }
    }
    
    @IBAction func backTouched(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func firstButtonTouched(_ sender: Any) {
        changeButton(firstButton, buttonIndex: 0, buttonClicked: true)
    }
    
    @IBAction func secondButtonTouched(_ sender: Any) {
        changeButton(secondButton, buttonIndex: 1, buttonClicked: true)
    }
    
    @IBAction func thirdButtonTouched(_ sender: Any) {
        changeButton(thirdButton, buttonIndex: 2, buttonClicked: true)
    }
    
    @IBAction func lastButtonTouched(_ sender: Any) {
        changeButton(lastButton, buttonIndex: 3, buttonClicked: true)
    }
    
    @IBAction func previousButtonTouched(_ sender: Any) {
        index -= 1
        if index <= 0 {
            disableButton(previousButton)
        }
        ableButton(nextButton)
        changeRoundData(index: index)
    }
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        index += 1
        
        disableButton(nextButton)
        if greatestIndex < index {
            greatestIndex = index
        }
        if index < testData.count {
            changeRoundData(index: index)
        } else {
            let storyboard = UIStoryboard(name: "TestResult", bundle: nil)
            guard let vc = storyboard.instantiateInitialViewController() as? TestResultViewController else { return }
            vc.modalPresentationStyle = .fullScreen
            vc.mistakes = self.mistakes
            present(vc, animated: true, completion: nil)
        }
    }
}
