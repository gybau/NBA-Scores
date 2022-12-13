//
//  StandingsViewModel.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import Foundation

class StandingsViewModel: ObservableObject {
    
    @Published var standings: [Standing] = [Standing]()
    
    func getStandingsForSeason2022() async {
        
        guard let url = URL(string: "\(Constants.STANDINGS_ENDPOINT)?key=\(Constants.API_KEY)") else {
            print("Invalid Standings URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            guard error == nil, let data = data else {
                print("Error fetching Standings: \(error!.localizedDescription)")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Standing].self, from: data)
                DispatchQueue.main.async {
                    self.standings = result
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
