//
//  GameModel.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 04/12/2022.
//

import Foundation

struct Response: Decodable {
    var games: [Game]
}

struct Game: Identifiable, Decodable {
    
    var id: Int
    var date: String
    var awayTeamName: String
    var homeTeamName: String
    var awayTeamId: Int
    var homeTeamId: Int
    var awayTeamScore: Int?
    var homeTeamScore: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "GameID"
        case date = "DateTime"
        case awayTeamName = "AwayTeam"
        case homeTeamName = "HomeTeam"
        case awayTeamId = "AwayTeamID"
        case homeTeamId = "HomeTeamID"
        case awayTeamScore = "AwayTeamScore"
        case homeTeamScore = "HomeTeamScore"
    }

    init() {
        self.id = 18506
        self.date = "2022-12-03T12:30:00"
        self.awayTeamName = "DAL"
        self.homeTeamName = "NY"
        self.awayTeamId = 25
        self.homeTeamId = 6
        self.awayTeamScore = 67
        self.homeTeamScore = 55
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.date = try container.decode(String.self, forKey: .date)
        self.awayTeamName = try container.decode(String.self, forKey: .awayTeamName)
        self.homeTeamName = try container.decode(String.self, forKey: .homeTeamName)
        self.awayTeamId = try container.decode(Int.self, forKey: .awayTeamId)
        self.homeTeamId = try container.decode(Int.self, forKey: .homeTeamId)
        self.awayTeamScore = try container.decode(Int?.self, forKey: .awayTeamScore)
        self.homeTeamScore = try container.decode(Int?.self, forKey: .homeTeamScore)
        
    }
}


