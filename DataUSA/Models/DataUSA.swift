//
//  DataUSA.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import Foundation

struct DataUSA: Decodable {
    var data: [DataState]?
    
}

struct DataState: Decodable {
    let state: String?
    let year: String?
    let population: Int?
    
//    init(dataUSA: [String: Any]) {
//        state = dataUSA["state"] as? String
//        year = dataUSA["year"] as? String
//        population = dataUSA["population"] as? Int
//    }
    
    enum CodingKeys: String, CodingKey {
        case state = "State"
        case year = "Year"
        case population = "Population"
    }
    
//    static func getDataUSA(from date: Any) -> [DataState] {
//        guard let dataUSA = date as? [String: Any] else { return []}
//        return dataUSA.compactMap { DataState(dataUSA: $0) }
//        }
//    }
}

enum Link: String {
    case dataUSALink = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"
}

