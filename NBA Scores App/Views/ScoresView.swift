//
//  ScoresView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 11/12/2022.
//

import SwiftUI

struct ScoresView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    enum days {
        case yesterday
        case today
        case tomorrow
    }
    
    @State var selectedDay: days = .today
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "NBA_Red")
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    var body: some View {
        
        

        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                Picker(selection: $selectedDay) {
                    Text("Yesterday")
                        .tag(days.yesterday)
                    Text("Today")
                        .tag(days.today)
                    Text("Tomorrow")
                        .tag(days.tomorrow)
                } label: {
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                LazyVStack {
                    ForEach(gameViewModel.games) { game in
                        ScoreCard(game: game, awayTeam: gameViewModel.getAwayTeam(game: game) ?? Team(), homeTeam: gameViewModel.getHomeTeam(game: game) ?? Team())
                            .padding(.bottom, 5)
                    }
                }
                
                .task {
                    await gameViewModel.getGamesForDate(date: Date.now.addingTimeInterval(-86400*2))
                    await gameViewModel.getTeams()
                }
                .animation(.easeInOut(duration: 0.5), value: gameViewModel.games.count)
                .padding()
            }
            
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView().environmentObject(GameViewModel())
    }
}
