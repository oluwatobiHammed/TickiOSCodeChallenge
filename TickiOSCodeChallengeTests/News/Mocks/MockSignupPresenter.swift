//
//  MockSignupPresenter.swift
//  TickiOSCodeChallengeTests
//
//  Created by Oladipupo Oluwatobi on 11/05/2021.
//

import XCTest
@testable import TickiOSCodeChallenge

class MockSignupPresenter: NewsPresenterProtocol {
    
    
    var processNewsCalled: Bool = false
    
    required init( webservice: NewsWebServiceProtocol, delegate: NewsViewDelegateProtocol) {
        // TODO:
    }
    
    
    func processNews() {
        processNewsCalled = true
    }

}
