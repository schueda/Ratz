//
//  TestResultViewController.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import UIKit

class TestResultViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        textField.delegate = self
        
        setupButton(submitButton)
        disableButton(submitButton)
        
        setupContainer(container)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupButton(_ button: UIButton) {
        button.layer.cornerRadius = 5
    }
    
    func disableButton(_ button: UIButton) {
        button.isEnabled = false
        button.alpha = 0.5
    }
    
    func ableButton(_ button: UIButton) {
        button.isEnabled = true
        button.alpha = 1
    }
    
    func setupContainer(_ container: UIView) {
        container.layer.cornerRadius = 10
        
        container.layer.shadowColor = UIColor(named: "shadowzinha")?.cgColor
        container.layer.shadowOpacity = 0.25
        container.layer.shadowRadius = 4
        container.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    @IBAction func backTouched(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nameChanged(_ sender: Any) {
        if let textFieldText = textField.text {
            if textFieldText.isEmpty {
                disableButton(submitButton)
            } else {
                ableButton(submitButton)
            }
        }
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
              let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 10
    }
}
