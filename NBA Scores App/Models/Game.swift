//
//  GameModel.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import Foundation



struct Game: Identifiable, Decodable, Equatable {
    
    var id: Int
    var date: String
    var awayTeamKey: String
    var homeTeamKey: String
    var awayTeamId: Int
    var homeTeamId: Int
    var awayTeamScore: Int?
    var homeTeamScore: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "GameID"
        case date = "DateTimeUTC"
        case awayTeamKey = "AwayTeam"
        case homeTeamKey = "HomeTeam"
        case awayTeamId = "AwayTeamID"
        case homeTeamId = "HomeTeamID"
        case awayTeamScore = "AwayTeamScore"
        case homeTeamScore = "HomeTeamScore"
    }

    init() {
        self.id = 18506
        self.date = "2022-12-03T12:30:00"
        self.awayTeamKey = "DAL"
        self.homeTeamKey = "NY"
        self.awayTeamId = 25
        self.homeTeamId = 6
        self.awayTeamScore = 67
        self.homeTeamScore = 55
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.date = try container.decode(String.self, forKey: .date)
        self.awayTeamKey = try container.decode(String.self, forKey: .awayTeamKey)
        self.homeTeamKey = try container.decode(String.self, forKey: .homeTeamKey)
        self.awayTeamId = try container.decode(Int.self, forKey: .awayTeamId)
        self.homeTeamId = try container.decode(Int.self, forKey: .homeTeamId)
        self.awayTeamScore = try container.decode(Int?.self, forKey: .awayTeamScore)
        self.homeTeamScore = try container.decode(Int?.self, forKey: .homeTeamScore)
        
    }
}


