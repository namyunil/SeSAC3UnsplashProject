//
//  APIService.swift
//  SeSAC3UnsplashProject
//
//  Created by NAM on 2023/09/12.
//

import Foundation
 
class APIService {
    
    static let shared = APIService()
    
    private let key = "4XAKUY4o2AszZ3mzeGWxR1J52u0b-jF2Jye0rWE4uB8"
    
    private init() { }
    
    func searchPhoto(query: String, completion: @escaping (Photo?) -> Void ) {
    
        
        
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(key)") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(Photo.self, from: data!)
                completion(result)
                
            } catch {
                print(error)
            }
        }.resume()
        
    }
    
}
