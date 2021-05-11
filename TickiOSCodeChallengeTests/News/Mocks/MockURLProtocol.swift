//
//  MockURLProtocol.swift
//  TickiOSCodeChallengeTests
//
//  Created by Oladipupo Oluwatobi on 11/05/2021.
//

import Foundation


class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    
    override func startLoading() {
 
        if let newsError = MockURLProtocol.error {
            self.client?.urlProtocol(self, didFailWithError: newsError)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
 
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() { }
    
}
