//
//  CustomTabItem.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import SwiftUI

struct CustomTabItem: View {
    @Binding var selectedTab: Tab.TabType
    
    var tab: Tab
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.symbol)
                .frame(height: 20)
            Text(tab.string)
                .font(.caption)
        }
        .foregroundColor(selectedTab == tab.type ? Color("NBA_Red") : .gray)
        .frame(height: 50)
        .onTapGesture {
            self.selectedTab = tab.type
        }
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    @State static var previewSelected = Tab.TabType.Scores
    static var previewTab: Tab = Tab(type: .Scores, string: "Scores", symbol: "sportscourt")
    static var previews: some View {
        CustomTabItem(selectedTab: $previewSelected, tab: previewTab)
    }
}
