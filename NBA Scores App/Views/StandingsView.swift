//
//  StandingsView.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import SwiftUI

struct StandingsView: View {
    
    @EnvironmentObject var standingsViewModel: StandingsViewModel
    
    @State var easternIsShowing = true
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack {
            Toggle("Change Conference", isOn: $easternIsShowing)
                
                ScrollView {
                    
                    LazyVStack {
                        switch easternIsShowing {
                            
                        case true:
                            
                            ForEach(standingsViewModel.standingsEastern) { standing in
                                if let index = standingsViewModel.standingsEastern.firstIndex(where: {$0.id == standing.id}) {
                                    StandingRow(standing: standing, index: index)
                                }
                            }
                        case false:
                            
                            ForEach(standingsViewModel.standingsWestern) { standing in
                                if let index = standingsViewModel.standingsWestern.firstIndex(where: {$0.id == standing.id}) {
                                    StandingRow(standing: standing, index: index)
                                }
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        StandingsView().environmentObject(StandingsViewModel())
    }
}
