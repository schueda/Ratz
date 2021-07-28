//
//  ViewController.swift
//  Ratz
//
//  Created by André Schueda on 28/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func PresentTest(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Test", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else { return }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}

