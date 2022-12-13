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
    
    var body: some View {
        HStack {
            Text("\(index + 1)")
            Text(standing.city ?? "")
            Text(standing.name ?? "")
        }
    }
}

struct StandingRow_Previews: PreviewProvider {
    static var previews: some View {
        StandingRow(standing: Standing(), index: 1)
    }
}
