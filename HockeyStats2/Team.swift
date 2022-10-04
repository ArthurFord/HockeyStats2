//
//  Team.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/3/22.
//

import Foundation

class Team: ObservableObject {
    @Published var team: [Player] = [Player(name: "Artie Ford", number: 91), Player(name: "Tucker", number: 25), Player(name: "Ski", number: 89), Player(name: "Tommy", number: 60), Player(name: "Cat", number: 68), Player(name: "Black", number: 47)]
    
    @Published var onIceTeam: [Player] = []
    
    func addPlayer(_ player: Player) {
        team.append(player)
    }
    
    func deselectAll() {
        for player in team {
            player.isSelected = false
        }
    }
    
    func selectedPlayer() -> Player {
        for player in team {
            if player.isSelected == true {
                return player
            }
            
        }
        return Player(name: "None", number: 00)
    }
}
