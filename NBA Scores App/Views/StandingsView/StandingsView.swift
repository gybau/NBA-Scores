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
    @State var selectedConference = StandingsViewModel.Conference.Eastern
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "NBA_Red")
        UISegmentedControl.appearance().backgroundColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("NBA_Blue"), Color("NBA_Red")], startPoint: .bottomLeading, endPoint: .topTrailing)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                
                HStack {
                    Text("Standings")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    Image("nba")
                        .resizable()
                        .scaledToFit()
                        
                        
                }
                .frame(height: 70)
                .padding(.bottom, 10)
                    
                
                Picker(selection: $selectedConference) {
                    Text("Eastern")
                        .tag(StandingsViewModel.Conference.Eastern)
                    Text("Western")
                        .tag((StandingsViewModel.Conference.Western))
                } label: {
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom)
                
                Divider()
                    .overlay(.white)
                    .padding(.horizontal, -20)
                LazyVGrid(columns: [
                    GridItem(.fixed(20)),
                    GridItem(.fixed(40)),
                    GridItem(.flexible()),
                    GridItem(.fixed(25)),
                    GridItem(.fixed(25)),
                    GridItem(.fixed(40)),
                    GridItem(.fixed(30))], alignment: .leading) {
                        Text("#")
                            .bold()
                        Text("")
                        Text("Team")
                        Text("W")
                        Text("L")
                        Text("%")
                        Text("STR")
                    }
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    
                ScrollView {
                    VStack(alignment: .leading) {
                        switch selectedConference {
                            
                        case .Eastern:
                            
                            ForEach(standingsViewModel.standingsEastern) { standing in
                                if let index = standingsViewModel.standingsEastern.firstIndex(where: {$0.id == standing.id}) {
                                    StandingRow(standing: standing, index: index)
                                        
                                    Divider()
                                        .overlay(.white)
                                }
                            }
                        case .Western:
                            
                            ForEach(standingsViewModel.standingsWestern) { standing in
                                if let index = standingsViewModel.standingsWestern.firstIndex(where: {$0.id == standing.id}) {
                                    StandingRow(standing: standing, index: index)
                                        
                                    Divider()
                                        .overlay(.white)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
        }
    }
}

struct StandingsView_Previews: PreviewProvider {
    static var previews: some View {
        let standingsViewModel = StandingsViewModel()
        StandingsView().environmentObject(standingsViewModel)
            .task {
                await standingsViewModel.getStandingsForSeason2022()
            }
    }
}
