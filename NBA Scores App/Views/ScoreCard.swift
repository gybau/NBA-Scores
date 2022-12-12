//
//  GameRow.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

struct ScoreCard: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var game: Game
    var awayTeam: Team
    var homeTeam: Team
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text(gameViewModel.formatDateToTime(date: game.date) ?? "No date available")
                    .font(.headline)
                    
                HStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack {
                            Image("\(homeTeam.key)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                            Text(homeTeam.key)
                                .font(.title3)
                                
                        }
                        .frame(width: 70)
                        Spacer()
                        Text(String(game.homeTeamScore ?? 0))
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    Spacer()
                    Text("-")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.gray)
                    Spacer()
                    HStack {
                        Spacer()
                        Text(String(game.awayTeamScore ?? 0))
                            .font(.title3)
                            .bold()
                        Spacer()
                        VStack {
                            Image("\(awayTeam.key)")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                            Text(awayTeam.key)
                                .font(.title3)
                                
                        }
                        .frame(width: 70)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
        .frame(height: 160)
        .cornerRadius(10)
        .shadow(radius: 3, x: 3, y: 3)
    }
}

struct ScoreCard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCard(game: Game(), awayTeam: Team(), homeTeam: Team()).environmentObject(GameViewModel())
    }
}
