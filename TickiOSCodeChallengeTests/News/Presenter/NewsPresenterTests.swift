//
//  NewsPresenterTests.swift
//  TickiOSCodeChallengeTests
//
//  Created by Oladipupo Oluwatobi on 11/05/2021.
//

import XCTest
@testable import TickiOSCodeChallenge
class NewsPresenterTests: XCTestCase {
    
    
    
    var mockNewsWebService: MockNewsWebService!
    var sut: NewsPresenter!
    var mockNewsViewDelegate: MockNewsViewDelegate!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockNewsWebService = MockNewsWebService()
        mockNewsViewDelegate = MockNewsViewDelegate()
        sut = NewsPresenter(webservice: mockNewsWebService,
                              delegate: mockNewsViewDelegate)
    }
    

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        mockNewsWebService = nil
        mockNewsViewDelegate = nil
        sut = nil
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange

        // Act
        sut.processNews()
        
        
        // Assert
        XCTAssertTrue(mockNewsWebService.isSignupMethodCalled, "The getNews() method was not called in the NewsWebService class")
    }
    
    func testNewsPresenter_WhenGetNewsOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected the successfulSignup() method to be called")
        mockNewsViewDelegate.expectation = myExpectation
        
        // Act
        sut.processNews()
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockNewsViewDelegate.successfulGetNewsCounter, 1, "The successfulGetNews() method was called more than one time")
    }
  
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
        mockNewsViewDelegate.expectation = errorHandlerExpectation
        mockNewsWebService.shouldReturnError = true
        
        // Act
        sut.processNews()
        self.wait(for: [errorHandlerExpectation], timeout: 5)

        // Assert
        XCTAssertEqual(mockNewsViewDelegate.successfulGetNewsCounter, 0)
        XCTAssertEqual(mockNewsViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockNewsViewDelegate.newsError)
    }



}
