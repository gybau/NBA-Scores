//
//  GameRow.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

struct GameRow: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    var game: Game
    var awayTeam: Team
    var homeTeam: Team
    
    var body: some View {
        ZStack {
            Color.white
            HStack {
                Spacer()
                HStack {
                    Image("\(homeTeam.key)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                    VStack {
                        Text(homeTeam.key)
                            .font(.headline)
                        Text(String(game.homeTeamScore ?? 0))
                            .font(.subheadline)
                    }
                    .frame(width: 40)
                }
                Spacer()
                Text("-")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.gray)
                Spacer()
                HStack {
                    VStack {
                        Text(awayTeam.key)
                            .font(.headline)
                        Text(String(game.awayTeamScore ?? 0))
                            .font(.subheadline)
                    }
                    .frame(width: 40)
                    Image("\(awayTeam.key)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                }
                Spacer()
            }
            .padding(.vertical, 10)
            
        }
        .frame(height: 60)
        .cornerRadius(10)
        .shadow(radius: 3, x: 3, y: 3)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: Game(), awayTeam: Team(), homeTeam: Team()).environmentObject(GameViewModel())
    }
}
