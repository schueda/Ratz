//
//  TestViewController.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var lastButton: UIButton!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton(firstButton)
        setupButton(secondButton)
        setupButton(thirdButton)
        setupButton(lastButton)
        
        setupNavigationButton(previousButton)
        setupNavigationButton(nextButton)
    }

    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 10
        
        button.layer.shadowColor = UIColor(named: "shadowzinha")?.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func setupNavigationButton(_ button: UIButton) {
        button.layer.cornerRadius = 5
        
        button.layer.shadowColor = UIColor(named: "shadowzinha")?.cgColor
        button.layer.shadowOpacity = 0.25
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    @IBAction func backTouched(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
    
    @IBAction func nextButtonTouched(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TestResult", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { print("alskdjas"); return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
