//
//  GoalView.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/3/22.
//

import SwiftUI

struct GoalView: View {
    @ObservedObject var player: Player
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.green)
            Text("\(player.number)")
                .foregroundColor(.white)
                .font(Font.custom("BlackOpsOne-Regular", size: 20, relativeTo: .title2))
                .fontWeight(.bold)
            
        }
        .frame(width: 40, height: 40, alignment: .center)
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView(player: Player(name: "Ski", number: 89))
    }
}
