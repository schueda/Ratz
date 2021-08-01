//
//  RankingDataSource.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import Foundation
import UIKit

class RankingDataSource: NSObject {
    let plays: [Play]
    
    init(plays: [Play]) {
        self.plays = plays
        print(plays)
    }
}

extension RankingDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PlayTableViewCell.self), for: indexPath) as! PlayTableViewCell
        let play = plays[indexPath.row]
        cell.name = play.name
        cell.misses = play.misses
        cell.position = indexPath.row + 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plays.count
    }
}
