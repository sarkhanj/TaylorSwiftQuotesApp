//
//  NetworkManager.swift
//  QuotesApp2
//
//  Created by Sarkhan Jafarli on 10/11/22.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://taylorswiftapi.herokuapp.com/get"
    
    func getRandomLyrics(completed: @escaping (Result<Lyrics, TSError>) -> Void) {
        let url = baseUrl
        
        guard let lyricsUrl = URL(string: url) else {
            completed(.failure(.incorrectUrl))
            return
        }
        
    
        let task = URLSession.shared.dataTask(with: lyricsUrl) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completed(.failure(.invalidResponse))
                return
            }
        
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Lyrics.self, from: data)
                completed(.success(decodedData))
            } catch {
                completed(.failure(.unableToComplete))
            }
            
        }
        
        task.resume()
    }
}
