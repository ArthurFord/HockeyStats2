//
//  PlayerView.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/3/22.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var player: Player
    
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .foregroundColor(.orange)
                .opacity(player.isSelected ? 1 : 0)
            Text("\(player.number)")
                .foregroundColor(.white)
                .font(Font.custom("BlackOpsOne-Regular", size: 20, relativeTo: .title2))
                .fontWeight(.bold)
            
        }
        
        .frame(width: 40, height: 40, alignment: .center)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(player: Player(name: "Test", number: 19))
    }
}
