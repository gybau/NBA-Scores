//
//  ContentView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var body: some View {
        VStack {
            ForEach(gameViewModel.games) { game in
                ZStack {
                    Color.white
                    HStack {
                        Spacer()
                        VStack {
                            Text(game.homeTeamName)
                            Text(String(game.homeTeamScore ?? 0))
                        }
                        Spacer()
                        Text("VS")
                        Spacer()
                        VStack {
                            Text(game.awayTeamName)
                            Text(String(game.awayTeamScore ?? 0))
                        }
                        Spacer()
                    }
                }
                .frame(height: 44)
                .cornerRadius(10)
                .shadow(radius: 10)
                
                
            }
        }
        .padding()
        
        .task {
            await gameViewModel.getGamesForDate(date: Date.now.addingTimeInterval(-86400*2))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
