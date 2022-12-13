//
//  StandingsView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import SwiftUI

struct StandingsView: View {
    
    @EnvironmentObject var standingViewModel: StandingsViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(standingViewModel.standings) { standing in
                            StandingRow(standing: standing)
                        }
                    }
                }
            }
        }
        .task {
            await standingViewModel.getStandingsForSeason2022()
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView().environmentObject(StandingsViewModel())
    }
}
