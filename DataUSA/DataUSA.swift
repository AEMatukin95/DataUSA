//
//  DataUSA.swift
//  DataUSA
//
//  Created by Александр Матукин on 29.11.2021.
//

import Foundation

struct DataUsa: Decodable {
    let data: [Datum]
}

struct Datum: Codable {
    let nation: String
    let year: String
    let population: Int
    let slugNation: String

    var description: String {
        """
    Nation: \(nation)
    Year: \(year)
    Population: \(population)
    Slug Nation: \(slugNation)
    """
    }
    
    enum CodingKeys: String, CodingKey {
        case nation = "Nation"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }

    
}
enum Link: String {
    case dataUSA = "https://datausa.io/api/data?drilldowns=Nation&measures=Population"
}
