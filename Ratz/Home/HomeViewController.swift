//
//  ViewController.swift
//  Ratz
//
//  Created by André Schueda on 28/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var rankingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton(testButton)
        setupButton(rankingButton)
    }

    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    @IBAction func touchedQuiz(_ sender: Any) {
        let storyboard = UIStoryboard(name: "QuizResult", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)

    }
    
    @IBAction func touchedTest(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)

    }
    
    @IBAction func touchedRanking(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
