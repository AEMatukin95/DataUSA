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
    let State: String?
    let Year: String?
    let Population: Int?
}

enum Link: String {
    case dataUSALink = "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest"
}
