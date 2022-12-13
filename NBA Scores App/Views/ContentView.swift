//
//  ContentView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    @EnvironmentObject var standingsViewModel: StandingsViewModel
    
    let tabs: [Tab] = [
        Tab(type: .Standings, string: "Standings", symbol: "list.dash"),
        Tab(type: .Scores, string: "Scores", symbol: "sportscourt"),
        Tab(type: .Settings, string: "Settings", symbol: "gear")
    ]
    
    @State var selectedTab = Tab.TabType.Scores
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                
                switch selectedTab {
                case .Scores:
                    ScoresView()
                case .Standings:
                    StandingsView()
                case .Settings:
                    Text("Settings View")
                    Spacer()
                }
                VStack {
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                    }
                    .stroke(Color("NBA_Red"), style: StrokeStyle(lineWidth: 3))
                    
                    HStack {
                        Spacer()
                        ForEach(tabs) { tab in
                            CustomTabItem(selectedTab: $selectedTab, tab: tab)
                                .frame(width: (geo.size.width - 40)/3)
                            
                        }
                        Spacer()
                    }
                    
                }
                .frame(height: 60)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameViewModel())
    }
}
