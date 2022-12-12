//
//  GameViewModel.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 08/12/2022.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    @Published var games = [Game]()
    @Published var teams = [Team]()
    
    
    // MARK: API Calls
    func getGamesForDate(date: Date) async {
        
        let components = Calendar.current.dateComponents([.day, .month, .year], from: date)
        
        let day = components.day ?? 0
        let month = components.month ?? 0
        let year = components.year ?? 2000
        
        print("Day \(day)")
        print("Month \(month)")
        print("Year \(year)")
        
        // Create URL
        guard let url = URL(string: "\(Constants.GAMES_BY_DATE_ENDPOINT)\(year)-\(month)-\(day)?key=\(Constants.API_KEY)") else {
            print("Invalid URL while getting games by date data")
            return
        }
        
        // Create URL Request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("GamesByData call returned nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Game].self, from: data)
                var now = DispatchTime.now()
                for r in result {
                    
                    DispatchQueue.main.asyncAfter(deadline: now) {
                        self.games.append(r)
                    }
                    now = now + 0.2
                }
                
            }
            catch {
                print("Failed to decode GamesByDate JSON: \(error)")
            }
        }
        dataTask.resume()
    }
    
    func getTeams() async {
        
        guard let url = URL(string: "\(Constants.TEAMS_ENDPOINT)?key=\(Constants.API_KEY)") else {
            print("Invalid URL while getting Teams data")
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else {
                print("Teams call returned nil")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Team].self, from: data)
                
                DispatchQueue.main.async {
                        self.teams = result
                }
            }
            catch {
                print("Failed to decode Teams data JSON: \(error)")
            }
        }
        dataTask.resume()
    }
    
    func getHomeTeam(game: Game) -> Team? {
        let id = game.homeTeamId
        
        return self.teams.first(where: {$0.id == id})
    }
    
    func getAwayTeam(game: Game) -> Team? {
        let id = game.awayTeamId
        
        return self.teams.first(where: {$0.id == id})
    }
    
    func formatDateToTime(date: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let newDate = dateFormatter.date(from: date) else {
            print("Couldn't create date from string")
            return nil
        }
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: newDate)
    }
    
    
    /*
    func getLogo(url: String?, completionHandler: @escaping (UIImage?) -> Void) {
        
        guard let url = url else {
            print("Logo url was nil")
            
            return
        }
        
        guard let url = URL(string: url) else {
            print("Invalid Logo URL")
            
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print("Problem with getting Data from URL: \(error!.localizedDescription)")
                return
            }
            let uiImage = UIImage(data: data ?? Data())
            completionHandler(uiImage)
        }
        dataTask.resume()
    }
     */
    
    
}
