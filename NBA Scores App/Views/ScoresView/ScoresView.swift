//
//  ScoresView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 11/12/2022.
//

import SwiftUI

struct ScoresView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    
    
    @State var selectedDay: GameViewModel.days = .today
    
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "NBA_Red")
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        
        

        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            VStack{
                Picker(selection: $selectedDay) {
                    Text("Yesterday")
                        .tag(GameViewModel.days.yesterday)
                    Text("Today")
                        .tag(GameViewModel.days.today)
                    Text("Tomorrow")
                        .tag(GameViewModel.days.tomorrow)
                } label: {
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedDay) { newValue in
                    gameViewModel.animateCards(day: newValue)
                }
                
                Divider()
                    .overlay(.white)
                
                HStack {
                    Text("Home")
                    Spacer()
                    Text("Away")
                }
                .font(.caption)
                .padding(.horizontal, 60)
                .foregroundColor(.white)
                
                ScrollView {
                    
                    switch selectedDay {
                        
                    case .yesterday:
                        
                        LazyVStack {
                            ForEach(gameViewModel.yesterdayGames) { game in
                                ScoreCard(game: game, awayTeam: gameViewModel.getAwayTeam(game: game) ?? Team(), homeTeam: gameViewModel.getHomeTeam(game: game) ?? Team())
                                    .padding(.bottom, 5)
                            }
                        }
                        .animation(.easeIn(duration: 0.2), value: gameViewModel.yesterdayGames.count)
                        .padding([.bottom, .horizontal])
                        
                    case .today:
                        
                        LazyVStack {
                            ForEach(gameViewModel.todayGames) { game in
                                ScoreCard(game: game, awayTeam: gameViewModel.getAwayTeam(game: game) ?? Team(), homeTeam: gameViewModel.getHomeTeam(game: game) ?? Team())
                                    .padding(.bottom, 5)
                            }
                        }
                        .animation(.easeIn(duration: 0.2), value: gameViewModel.todayGames.count)
                        .padding([.bottom, .horizontal])
                        
                    case .tomorrow:
                        
                        LazyVStack {
                            ForEach(gameViewModel.tomorrowGames) { game in
                                ScoreCard(game: game, awayTeam: gameViewModel.getAwayTeam(game: game) ?? Team(), homeTeam: gameViewModel.getHomeTeam(game: game) ?? Team())
                                    .padding(.bottom, 5)
                            }
                        }
                        .animation(.easeIn(duration: 0.2), value: gameViewModel.tomorrowGames.count)
                        .padding([.bottom, .horizontal])
                    }
                }
            }
        }
        .onDisappear {
            gameViewModel.todayGames.removeAll()
            gameViewModel.yesterdayGames.removeAll()
            gameViewModel.tomorrowGames.removeAll()
        }
        .task {
            
            await gameViewModel.getGamesForDate(date: Date().dayBefore)
            await gameViewModel.getGamesForDate(date: Date())
            await gameViewModel.getGamesForDate(date: Date().dayAfter)
            await gameViewModel.getTeams()
        }
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView().environmentObject(GameViewModel())
    }
}
