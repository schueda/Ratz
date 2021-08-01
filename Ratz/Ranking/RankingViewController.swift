//
//  RankingViewController.swift
//  Ratz
//
//  Created by André Schueda on 29/07/21.
//

import UIKit

class RankingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dataSource = RankingDataSource(plays: UsersDefaultRankingRepository().get())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(PlayTableViewCell.self, forCellReuseIdentifier: "PlayCell")
        tableView.layer.cornerRadius = 10
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    
    @IBAction func backTouched(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion:nil)
    }
    
}
