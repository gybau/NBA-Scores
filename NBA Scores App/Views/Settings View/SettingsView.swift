//
//  SettingsView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 14/12/2022.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    let columns = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    
                    Text("Favorite Team")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    if let selectedTeam = getTeamKey(id: gameViewModel.favoriteTeam) {
                        Image(selectedTeam)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        
                    }
                }
                .frame(height: 70)
                .padding(.bottom, 10)
                
                Divider()
                    .overlay(.white)
                    .padding(.horizontal, -20)
                    .padding(.bottom, 10)
                
                ScrollView {
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(gameViewModel.teams) { team in
                            Button {
                                gameViewModel.favoriteTeam = team.id
                            } label: {
                                ZStack{
                                    Circle()
                                        .frame(width: 100)
                                        .foregroundColor(team.id == gameViewModel.favoriteTeam ? .white.opacity(0.3) : .white.opacity(0))
                                    Circle()
                                        .strokeBorder(team.id == gameViewModel.favoriteTeam ? .black.opacity(1) : .black.opacity(0))
                                        .frame(width: 100)
                                        
                                        
                                    Image("\(team.key)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .padding(10)
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.bottom)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
        }
    }
    
    func getTeamKey(id: Int?) -> String? {
        for team in gameViewModel.teams {
            if team.id == id {
                return team.key
            }
        }
        return nil
    }
}



struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let gameViewModel = GameViewModel()
        SettingsView()
            .environmentObject(gameViewModel)
            .task {
                await gameViewModel.getTeams()
            }
        
    }
}
