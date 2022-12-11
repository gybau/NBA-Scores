//
//  Team.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 10/12/2022.
//

import Foundation

struct Team: Decodable {
    
    var id: Int
    var key: String
    var city: String?
    var name: String?
    var primaryColor: String?
    var secondaryColor: String?
    var logoUrl: String?
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "TeamID"
        case key = "Key"
        case city = "City"
        case name = "Name"
        case primaryColor = "PrimaryColor"
        case secondaryColor = "SecondaryColor"
        case logoUrl = "WikipediaLogoUrl"
    }
    
    init() {
        self.id = 1
        self.key = "WAS"
        self.city = "Washington"
        self.name = "Wizards"
        self.primaryColor = "002B5C"
        self.secondaryColor = "E31837"
        self.logoUrl = "https://upload.wikimedia.org/wikipedia/en/0/02/Washington_Wizards_logo.svg"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.key = try container.decode(String.self, forKey: .key)
        self.city = try container.decode(String?.self, forKey: .city)
        self.name = try container.decode(String?.self, forKey: .name)
        self.primaryColor = try container.decode(String?.self, forKey: .primaryColor)
        self.secondaryColor = try container.decode(String?.self, forKey: .secondaryColor)
        self.logoUrl = try container.decode(String?.self, forKey: .logoUrl)
    }
    
    
}
