//
//  NBA_Scores_AppApp.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

@main
struct NBA_Scores_AppApp: App {
    
    let gameViewModel = GameViewModel()
    let standingsViewModel = StandingsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameViewModel)
                .environmentObject(standingsViewModel)
                .task {
                    await standingsViewModel.getStandingsForSeason2022()
                }
        }
    }
}
