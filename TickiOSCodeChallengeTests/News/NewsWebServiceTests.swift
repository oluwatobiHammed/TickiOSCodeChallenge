//
//  NewsWebServiceTests.swift
//  TickiOSCodeChallengeTests
//
//  Created by Oladipupo Oluwatobi on 11/05/2021.
//

import XCTest
@testable import TickiOSCodeChallenge

class NewsWebServiceTests: XCTestCase {
    var sut:NewsWebService!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = NewsWebService(urlString: NewsConstants.newsURLString, urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }

    func testNewsWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "getNews() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.getNews( methodFor: .GET) { (newsResponseModel, error) in
            
            // Assert
            XCTAssertNil(newsResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, NewsError.invalidResponseModel, "The getNews() method did not return expected error")
            expectation.fulfill()
            
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

    func testNewsWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        sut = NewsWebService(urlString: "")
        
        // Act
        sut.getNews( methodFor: .GET) { (newsResponseModel, error) in
            
            // Assert
            XCTAssertEqual(error, NewsError.invalidRequestURLString, "The getNews() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(newsResponseModel, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    

}
