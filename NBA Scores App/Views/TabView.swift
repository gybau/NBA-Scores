//
//  ContentView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

struct TabView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    ForEach(gameViewModel.games) { game in
                        GameRow(game: game, awayTeam: gameViewModel.getAwayTeam(game: game) ?? Team(), homeTeam: gameViewModel.getHomeTeam(game: game) ?? Team())
                            .padding(.bottom, 5)
                    }
                }
                .padding()
                .task {
                    await gameViewModel.getGamesForDate(date: Date.now.addingTimeInterval(-86400*2))
                    await gameViewModel.getTeams()
                }
            }
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView().environmentObject(GameViewModel())
    }
}
