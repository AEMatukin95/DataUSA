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
    
    init(data: [String: Any]) {
        state = data["State"] as? String
        year = data["Year"] as? String
        population = data["Population"] as? Int
    }
    
    enum CodingKeys: String, CodingKey {
        case state = "State"
        case year = "Year"
        case population = "Population"
    }
    
    static func getDataUSA(from date: Any) -> [DataState] {
        guard let dataUSA = date as? [String: Any] else { return []}
        guard let dataUSAArray = dataUSA["data"] as? [Any] else { return []}
        guard let dataStateArray = dataUSAArray as? [[String: Any]] else { return []}
        var dataStateUSA: [DataState] = []
        for data in dataStateArray {
            let dataState = DataState(data: data)
            dataStateUSA.append(dataState)
        }
        return dataStateUSA
    }
}

enum Link: String {
    case dataUSALink = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"
}

