//
//  NBA_Scores_AppApp.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import SwiftUI

@main
struct NBA_Scores_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(GameViewModel())
                .environmentObject(StandingsViewModel())
        }
    }
}
