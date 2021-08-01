//
//  PlaysRepository.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import Foundation

protocol RankingRepository {
    func get() -> [Play]
    func save(play: Play) -> Int
}

class UsersDefaultRankingRepository: RankingRepository {
    static let key = "ranking"
    
    func get() -> [Play] {
        var ranking: [Play] = []
        if let keys = UserDefaults.standard.array(forKey: Self.key) as? [String] {
            for key in keys {
                if let data = UserDefaults.standard.data(forKey: key) {
                    do {
                        ranking.append(try JSONDecoder().decode(Play.self, from: data))
                    } catch {
                        print("Error getting ranking")
                    }
                }
            }
        }
        return ranking.sorted()
    }
    
    func save(play: Play) -> Int {
        do {
            let data = try JSONEncoder().encode(play)
            let key = UUID().uuidString
            UserDefaults.standard.setValue(data, forKey: key)
            
            if var keys = UserDefaults.standard.array(forKey: Self.key) {
                keys.append(key)
                UserDefaults.standard.setValue(keys, forKey: Self.key)
            } else {
                UserDefaults.standard.setValue([key], forKey: Self.key)
            }
            
            let ranking = self.get()
            print(ranking)
            print(ranking.firstIndex(of: play) ?? 0)
            return ranking.firstIndex(of: play) ?? 0
        } catch {
            print("Error saving play")
        }
        return 0
    }
}
