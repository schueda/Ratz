//
//  PlayTableViewCell.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import UIKit

class PlayTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var missesLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    var name: String? {
        didSet { nameLabel.text = name ?? "" }
    }
    
    var misses: Int? {
        didSet { missesLabel.text = "erros: \(misses ?? 0)"; }
    }
    
    var position: Int? {
        didSet {
            positionLabel.text = "\(position ?? 1)°"
        }
    }
}
