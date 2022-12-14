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
            RoundedRectangle(cornerRadius: 5).stroke( style: StrokeStyle(lineWidth: 3))
            VStack(spacing: 0) {
                Text(gameViewModel.formatDateToTime(date: game.date) ?? "No date available")
                    .font(.caption)
                HStack {
                    
                    HStack {
                        Spacer()
                        VStack {
                            ZStack{
                                
                                Image("\(homeTeam.key)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 70)
                                if homeTeam.id == gameViewModel.favoriteTeam {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .offset(x: 35, y: -35)
                                }
                                
                            }
                            
                            Text(homeTeam.name ?? "")
                                .font(.footnote)
                                
                            
                        }
                        .frame(width: 70)
                        Spacer()
                        Text(String(scoreFormat(score: game.homeTeamScore)))
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    
                    Text("-")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.gray)
                    
                    HStack {
                        Spacer()
                        Text(String(scoreFormat(score: game.awayTeamScore)))
                            .font(.title3)
                            .bold()
                        Spacer()
                        VStack {
                            ZStack {
                                Image("\(awayTeam.key)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 70)
                                if awayTeam.id == gameViewModel.favoriteTeam {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .offset(x: 35, y: -35)
                                }
                            }
                            
                            Text(awayTeam.name ?? "")
                                .font(.footnote)
                                
                        }
                        .frame(width: 70)
                        Spacer()
                    }
                    
                }
            }
        }
        
        .frame(height: 150)
        .cornerRadius(5)
        .shadow(radius: 3, x: 3, y: 3)
    }
    
    func scoreFormat(score: Int?) -> String {
        
        if score == nil {
            return "n/a"
        }
        else {
            return String(score!)
        }
    }
}

struct ScoreCard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCard(game: Game(), awayTeam: Team(), homeTeam: Team()).environmentObject(GameViewModel())
    }
}
