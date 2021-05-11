//
//  MockNewsWebService.swift
//  TickiOSCodeChallengeTests
//
//  Created by Oladipupo Oluwatobi on 11/05/2021.
//

import XCTest
@testable import TickiOSCodeChallenge

class MockNewsWebService: NewsWebServiceProtocol {

    
       var isSignupMethodCalled: Bool = false
       var shouldReturnError: Bool = false
    
       func getNews( methodFor httpRequest: HttpMethods, completionHandler: @escaping (NewsResponseModel?, NewsError?) -> Void) {
           
           isSignupMethodCalled = true
           
           if shouldReturnError {
               completionHandler(nil, NewsError.failedRequest(description: "Signup request was not successful"))
           } else {
               let responseModel = NewsResponseModel(response: Response(status: "ok", results: [Result]()))
               completionHandler(responseModel, nil)
           }
    
       }

}
