//
//  MockURLProtocol.swift
//  CatFactsApp
//
//  Created by DonMokong on 12/16/24.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var stubbedResponseData: Data?
    static var stubbedResponseError: Error?
    static var stubbedResponseStatusCode: Int = 200

    override class func canInit(with request: URLRequest) -> Bool {
        return true // Intercept all requests
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let error = MockURLProtocol.stubbedResponseError {
            client?.urlProtocol(self, didFailWithError: error)
        } else if let data = MockURLProtocol.stubbedResponseData {
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: MockURLProtocol.stubbedResponseStatusCode,
                                           httpVersion: nil,
                                           headerFields: nil)
            client?.urlProtocol(self, didReceive: response!, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
        }
    }

    override func stopLoading() {}
}
