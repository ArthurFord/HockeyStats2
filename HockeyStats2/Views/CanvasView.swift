    //
    //  CanvasView.swift
    //  HockeyStats2
    //
    //  Created by Arthur Ford on 10/2/22.
    //

import SwiftUI

struct CanvasView: View {
    @ObservedObject var viewModel: CanvasViewModel
    @ObservedObject var team: Team
    @State var longPressLocation = CGPoint.zero
    
    var body: some View {
        ZStack {
            Image("halfRink")
                .frame(width: 800, height: 1100, alignment: .top)
            Canvas { context, size in
                let frame = CGRect(x: 110, y: 0, width: 900, height: 950)
                for shot in viewModel.shots {
                    if shot.0.y > frame.minY &&
                        shot.0.x > frame.minX &&
                        shot.0.y < frame.height &&
                        shot.0.x < frame.width {
                        let shotView = context.resolveSymbol(id: shot.0.x)
                        context.draw(shotView!, at: shot.0)
                    }
                }
                for goal in viewModel.goals {
                    if goal.0.y > frame.minY &&
                        goal.0.x > frame.minX &&
                        goal.0.y < frame.height &&
                        goal.0.x < frame.width {
                        let goalView = context.resolveSymbol(id: goal.0.x)
                        context.draw(goalView!, at: goal.0)
                    }
                }
            }
        symbols: {
            ForEach(viewModel.shots, id: \.0.debugDescription) { shot, player in
                ShotView(player: player).tag(shot.x)
            }
            ForEach(viewModel.goals, id: \.0.debugDescription) { goal, player in
                GoalView(player: player).tag(goal.x)
            }
        }
        .gesture(LongPressGesture().sequenced(before: DragGesture(minimumDistance: 0, coordinateSpace: .local)).onEnded({ value in
            switch value {
                case .second(true, let drag):
                    longPressLocation = drag?.startLocation ?? .zero
                    if team.selectedPlayer().number != -1 {
                        viewModel.addGoal(longPressLocation, player: team.selectedPlayer())
                        team.selectedPlayer().goals += 1
                    }
                    
                default: break
            }
        }))
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onEnded({ value in
            if team.selectedPlayer().number != -1 {
                viewModel.addShot(value.startLocation, player: team.selectedPlayer())
                team.selectedPlayer().shotsOnNet += 1
            }
        }))
        }
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView(viewModel: CanvasViewModel(), team: Team())
    }
}
