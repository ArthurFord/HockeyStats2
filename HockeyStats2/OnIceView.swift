//
//  OnIceView.swift
//  HockeyStats2
//
//  Created by Arthur Ford on 10/3/22.
//

import SwiftUI

struct OnIceView: View {
    @ObservedObject var team: Team
    
    var body: some View {
        HStack {
            ForEach(team.team, id: \.number) { player in
                if player.onIce == true {
                    PlayerView(player: player)
                        .padding(.all)
                        .gesture(LongPressGesture(minimumDuration: 1).onEnded({ value in
                            player.onIce = false
                            if let index = team.onIceTeam.firstIndex(of: team.selectedPlayer()) {
                                team.onIceTeam.remove(at: index)
                                team.selectedPlayer().isSelected = false
                            }
                        }))
                    
                        .highPriorityGesture(TapGesture().onEnded({ value in
                            team.deselectAll()
                            player.isSelected = true
                        }))
                       
                }
                
            }
        }
    }
}

struct OnIceView_Previews: PreviewProvider {
    static var previews: some View {
        OnIceView(team: Team())
    }
}
