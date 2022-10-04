//
//  PlayerListView.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/4/22.
//

import SwiftUI

struct PlayerListView: View {
    
    @ObservedObject var team: Team
    
    var body: some View {
        List(team.team, id: \.self) { player in
            RowView(player: player)
        }
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView(team: Team())
    }
}
