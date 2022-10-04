//
//  CanvasViewModel.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/2/22.
//

import Foundation


class CanvasViewModel: ObservableObject {
    
    @Published var shots: [(CGPoint, Player)] = []
    var size: CGSize = CGSize(width: 30, height: 30)
    
    @Published var goals: [(CGPoint, Player)] = []
    
    func addShot(_ point: CGPoint, player: Player) {
        shots.append((point, player))
    }
    
    func addGoal(_ point: CGPoint, player: Player) {
        goals.append((point, player))
    }
    
}
