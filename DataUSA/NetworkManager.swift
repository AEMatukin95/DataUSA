//
//  NetworkManager.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import Foundation

extension ViewController {
 
    func fetchData() {
        guard let url = URL(string: Link.dataUSA.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let datas = try JSONDecoder().decode(DataUsa.self, from: data)
                print(datas)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
