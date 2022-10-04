//
//  RowView.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/4/22.
//

import SwiftUI

struct RowView: View {
    var player: Player
    
    var body: some View {
        HStack {
            
            PlayerView(player: player)
            Text(player.name)
            Spacer()
            VStack {
                Text("Shots")
                Text("\(player.shotsOnNet)")
            }
            .padding(.horizontal, 32)
            VStack {
                Text("Goals")
                Text("\(player.goals)")
            }
            
        }
        .padding(.all)
        .padding(.horizontal, 32)
        
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(player: Team().team[0])
    }
}
