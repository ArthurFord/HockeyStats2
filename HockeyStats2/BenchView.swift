    //
    //  BenchView.swift
    //  HockeyStats2
    //
    //  Created by Arthur Ford on 10/3/22.
    //

import SwiftUI

struct BenchView: View {
    @ObservedObject var team: Team
    
    var body: some View {
        HStack {
            ForEach(team.team, id: \.number) { player in
                if player.onIce == false {
                    PlayerView(player: player)
                        .padding(.all)
                        .onTapGesture {
                            team.onIceTeam.append(player)
                            if let index = team.onIceTeam.firstIndex(of: team.selectedPlayer()) {
                                team.onIceTeam.remove(at: index)
                                
                            }
                            player.onIce = true
                            team.selectedPlayer().onIce = false
                            team.selectedPlayer().isSelected = false
                        }
                }
            }
        }
    }
}

struct BenchView_Previews: PreviewProvider {
    static var previews: some View {
        BenchView(team: Team())
    }
}
