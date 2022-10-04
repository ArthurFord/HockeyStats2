    //
    //  ContentView.swift
    //  HockeyStats2
    //
    //  Created by Arthur Ford on 10/2/22.
    //

import SwiftUI

struct ContentView: View {
    @ObservedObject var team = Team()
    @ObservedObject var viewModel = CanvasViewModel()
    
    var body: some View {
        TabView {
            VStack(alignment: .center) {
                CanvasView(viewModel: viewModel, team: team)
                OnIceView(team: team)
                ScrollView(.horizontal, showsIndicators: false) {
                    BenchView(team: team)
                }
            }
            .tabItem {
                Label("Chart", systemImage: "pencil.and.outline")
            }
            PlayerListView(team: team)
                .tabItem {
                    Label("Stats", systemImage: "list.bullet.rectangle")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
