//
//  NewsWebService.swift
//  TickiOSCodeChallenge
//
//  Created by Oladipupo Oluwatobi on 10/05/2021.
//

import Foundation

class NewsWebService: NewsWebServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func getNews( methodFor httpRequest: HttpMethods, completionHandler: @escaping (NewsResponseModel?, NewsError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, NewsError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpRequest.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
       
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, NewsError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data=data, let signupResponseModel = try? JSONDecoder().decode(NewsResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                completionHandler(nil, NewsError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
}
