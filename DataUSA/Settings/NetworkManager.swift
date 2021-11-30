//
//  NetworkManager.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import Foundation

class NetworkManager {
    
    var dataUSA: DataUSA?
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(completed: @escaping () -> ()) {
        guard let url = URL(string: Link.dataUSALink.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                self.dataUSA = try JSONDecoder().decode(DataUSA.self, from: data)
                completed()
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
