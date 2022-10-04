//
//  ShotView.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/3/22.
//

import SwiftUI

struct ShotView: View {
    @ObservedObject var player: Player
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.orange)
            Text("\(player.number)")
                .font(Font.custom("BlackOpsOne-Regular", size: 20, relativeTo: .title2))
                .foregroundColor(.white)
                
                
            
        }
        .frame(width: 40, height: 40, alignment: .center)
    }
}

struct ShotView_Previews: PreviewProvider {
    static var previews: some View {
        ShotView(player: Player(name: "Ski", number: 89))
    }
}
