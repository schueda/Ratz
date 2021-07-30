//
//  RankingViewController.swift
//  Ratz
//
//  Created by André Schueda on 29/07/21.
//

import UIKit

class RankingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dataSource: RankingDataSource = .init(plays: [
                                                Play(name: "marquinhos", misses: 2),
                                                Play(name: "marquinhos", misses: 2),
                                                Play(name: "marquinhos", misses: 2),
                                                Play(name: "marquinhos", misses: 2)])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.layer.cornerRadius = 10
//        tableView.dataSource =  
//        tableView.reloadData()
    }
    
}
