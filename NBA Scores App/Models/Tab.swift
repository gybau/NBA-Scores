//
//  Tab.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import Foundation

struct Tab: Identifiable {
    
    var id = UUID()
    var type: TabType
    var string: String
    var symbol: String
    
    enum TabType {
        case Scores
        case Standings
        case Settings
    }
    
    
    
}
