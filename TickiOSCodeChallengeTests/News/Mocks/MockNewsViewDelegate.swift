//
//  MockNewsViewDelegate.swift
//  TickiOSCodeChallengeTests
//
//  Created by Oladipupo Oluwatobi on 11/05/2021.
//

import XCTest
@testable import TickiOSCodeChallenge

class MockNewsViewDelegate: NewsViewDelegateProtocol {
    
    

    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorHandlerCounter = 0
    var newsError: NewsError?
    
    func successGetNews(response: NewsResponseModel) {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: NewsError) {
        newsError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }

}
