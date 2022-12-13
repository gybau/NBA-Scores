//
//  Standing.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import Foundation

struct Standing: Decodable, Identifiable {
    
    var season: Int
    var id: Int
    var key: String
    var city: String?
    var name: String?
    var conference: String?
    var division: String?
    var wins: Int?
    var losses: Int?
    var winPercentage: Double?
    var conferenceWins: Int?
    var conferenceLosses: Int?
    var divisionWins: Int?
    var divisionLosses: Int?
    var streak: String?
    var conferenceRank: Int?
    var divisionRank: Int?
    
    enum CodingKeys: String, CodingKey {
        case season = "Season"
        case id = "TeamID"
        case key = "Key"
        case city = "City"
        case name = "Name"
        case conference = "Conference"
        case division = "Division"
        case wins = "Wins"
        case losses = "Losses"
        case winPercentage = "Percentage"
        case conferenceWins = "ConferenceWins"
        case conferenceLosses = "ConferenceLosses"
        case divisionWins = "DivisionWins"
        case divisionLosses = "DivisionLosses"
        case streak = "StreakDescription"
        case conferenceRank = "ConferenceRank"
        case divisionRank = "DivisionRank"
    }
    
    init() {
        self.season = 2022
        self.id = 7
        self.key = "PHI"
        self.city = "Philadelphia"
        self.name = "76ers"
        self.conference = "Eastern"
        self.division = "Atlantic"
        self.wins = 51
        self.losses = 31
        self.winPercentage = 0.622
        self.conferenceWins = 32
        self.conferenceLosses = 20
        self.divisionWins = 6
        self.divisionLosses = 10
        self.streak = "W2"
        self.conferenceRank = 12
        self.divisionRank = 6
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.season = try container.decode(Int.self, forKey: .season)
        self.id = try container.decode(Int.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.city = try container.decode(String?.self, forKey: .city)
        self.name = try container.decode(String?.self, forKey: .name)
        self.conference = try container.decode(String?.self, forKey: .conference)
        self.division = try container.decode(String?.self, forKey: .division)
        self.wins = try container.decode(Int?.self, forKey: .wins)
        self.losses = try container.decode(Int?.self, forKey: .losses)
        self.winPercentage = try container.decode(Double?.self, forKey: .winPercentage)
        self.conferenceWins = try container.decode(Int?.self, forKey: .conferenceWins)
        self.conferenceLosses = try container.decode(Int?.self, forKey: .conferenceLosses)
        self.divisionWins = try container.decode(Int?.self, forKey: .divisionWins)
        self.divisionLosses = try container.decode(Int?.self, forKey: .divisionLosses)
        self.streak = try container.decode(String?.self, forKey: .streak)
        self.conferenceRank = try container.decode(Int?.self, forKey: .conferenceRank)
        self.divisionRank = try container.decode(Int?.self, forKey: .divisionRank)

    }
}
