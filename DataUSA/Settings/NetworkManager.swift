//
//  NetworkManager.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(DataUSA) -> Void) {
        guard let url = URL(string: url ?? "") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let dataUSA = try JSONDecoder().decode(DataUSA.self, from: data)
                DispatchQueue.main.async {
                    completion(dataUSA)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

