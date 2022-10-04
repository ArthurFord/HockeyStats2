//
//  Player.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/3/22.
//

import Foundation

class Player: ObservableObject {
    
    let name: String
    var number: Int
    @Published var isSelected = false
    @Published var onIce = false
    @Published var shotsOnNet = 0
    @Published var goals = 0
    @Published var assists = 0
    
    init(name: String, number: Int, onIce: Bool = false) {
        self.name = name
        self.number = number
        self.onIce = onIce
    }
    
    func playPlayer() {
        onIce.toggle()
    }
    
    
}

extension Player: Hashable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(number)
    }
}
