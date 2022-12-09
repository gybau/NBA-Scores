//
//  GameViewModel.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 08/12/2022.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var games = [Game]()
    
    init() {
        
    }
    
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
            print("Invalid URL")
            return
        }
        
        // Create URL Request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.addValue("{\(Constants.API_KEY)}", forHTTPHeaderField: "Ocp-Apim-Subscription-Key")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Game].self, from: data!)
                DispatchQueue.main.async {
                    self.games = result
                }
                
            }
            catch {
                print("Failed to decode JSON: \(error)")
                
            }
           
        }
        dataTask.resume()
        
        
    }
    
    
}
