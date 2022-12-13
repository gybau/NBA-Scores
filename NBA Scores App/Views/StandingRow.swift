//
//  StandingRow.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import SwiftUI

struct StandingRow: View {
    
    var standing: Standing
    
    var body: some View {
        HStack {
            Text(String(standing.conferenceRank ?? 0))
        }
    }
}

struct StandingRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingRow(standing: Standing())
    }
}
