//
//  NewsWebServiceProtocol.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import Foundation

protocol NewsWebServiceProtocol {
    func getNews(methodFor httpRequest: HttpMethods, completionHandler: @escaping (NewsResponseModel?, NewsError?) -> Void)
}
