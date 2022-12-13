//
//  StandingsViewModel.swift
//  NBA Scores App
//
//  Created by Michał Ganiebny on 13/12/2022.
//

import Foundation

class StandingsViewModel: ObservableObject {
    
    
    @Published var standingsEastern: [Standing] = [Standing]()
    @Published var standingsWestern: [Standing] = [Standing]()
    
    enum Conference: String {
        case Eastern = "Eastern"
        case Western = "Western"
    }
    
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
                
                var easternUnsorted = [Standing]()
                var westernUnsorted = [Standing]()
                
                for r in result {
                    if r.conference == Conference.Eastern.rawValue {
                        easternUnsorted.append(r)
                    }
                    else {
                        westernUnsorted.append(r)
                    }
                }
                let easternSorted = easternUnsorted.sorted {
                    return $0.winPercentage ?? 0 > $1.winPercentage ?? 0
                }
                let westernSorted = westernUnsorted.sorted {
                    return $0.winPercentage ?? 0 > $1.winPercentage ?? 0
                }
                DispatchQueue.main.async {
                    self.standingsEastern = easternSorted
                    self.standingsWestern = westernSorted
                }
                
                
            }
            catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
