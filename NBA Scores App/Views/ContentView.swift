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
        TabView {
            ScoresView()
                .tabItem {
                    VStack {
                        Image(systemName: "sportscourt")
                        Text("Scores")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GameViewModel())
    }
}
