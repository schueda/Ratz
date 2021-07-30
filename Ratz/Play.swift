//
//  Play.swift
//  Ratz
//
//  Created by André Schueda on 30/07/21.
//

import Foundation

struct Play {
    let name: String
    let misses: Int
}

extension Play: Comparable {
    static func < (lhs: Play, rhs: Play) -> Bool {
            if lhs.misses < rhs.misses { return true }
            else { return lhs.misses == rhs.misses && lhs.name < rhs.name }
        }
}
