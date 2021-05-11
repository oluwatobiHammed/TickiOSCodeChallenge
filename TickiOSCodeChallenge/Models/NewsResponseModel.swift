//
//  NewsResponseModel.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import Foundation

struct NewsResponseModel: Decodable {
    let response: Response
}

struct Response: Decodable {
    let status: String
    let results: [Result]
}

struct Result: Decodable {
    let type: String
    let sectionName: String
    let apiUrl: String
}
