//
//  NetworkManager.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import Foundation
import Alamofire

enum NetworkError: Error{
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, with completion: @escaping(Result<DataUSA, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let dataUSA = try JSONDecoder().decode(DataUSA.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataUSA))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
    // MARK: - Alamofire
//    func fetchDataWithAlamofire(from url: String, with completion: @escaping(Result<[DataState], NetworkError>) -> Void) {
//        AF.request(url)
//            .validate()
//            .responseJSON { dataUSA in
//                switch dataUSA.result {
//                case .success(let date):
//                    let dataUSA = DataState.getDataUSA(from: date)
//                    completion(.success(dataUSA))
//                case .failure(_):
//                    completion(.failure(.decodingError))
//                }
//            }
//    }
    
}
