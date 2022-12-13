//
//  StandingRow.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import SwiftUI

struct StandingRow: View {
    
    var standing: Standing
    var index: Int
    
    var isPreview = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(isPreview ? .black : .white.opacity(0))
            
                HStack {
                    LazyVGrid(columns: [
                        GridItem(.fixed(20)),
                        GridItem(.fixed(40)),
                        GridItem(.fixed(150)),
                        GridItem(.fixed(25)),
                        GridItem(.fixed(25)),
                        GridItem(.fixed(40))], alignment: .leading) {
                            Text("\(index + 1)")
                                .bold()
                            Image("\(standing.key)")
                                .resizable()
                                .scaledToFit()
                            Text("\(standing.city ?? "") \(standing.name ?? "")")
                            Text(String(standing.wins ?? 0))
                            Text(String(standing.losses ?? 0))
                            Text(String(format: "%.2f", standing.winPercentage ?? 0))
                            
                        }
                }
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

struct StandingRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingRow(standing: Standing(), index: 10, isPreview: true)
    }
}
