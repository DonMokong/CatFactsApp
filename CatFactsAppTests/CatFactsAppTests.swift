//
//  CatFactsAppTests.swift
//  CatFactsAppTests
//
//  Created by DonMokong on 12/15/24.
//

import XCTest
@testable import CatFactsApp

class CatFactsAppTests: XCTestCase {
    
    var viewModel: CatViewModel!

    override func setUpWithError() throws {
        viewModel = CatViewModel()
        
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDownWithError() throws {
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }

    func testFetchCatData_Success() {
        let mockData = """
        [
            {
                "id": "8m9",
                "url": "https://cdn2.thecatapi.com/images/8m9.jpg",
                "width": 612,
                "height": 612
            }
        ]
        """.data(using: .utf8)
        MockURLProtocol.stubbedResponseData = mockData

        viewModel.fetchCatData()

        XCTAssertEqual(viewModel.catImageURL, "https://cdn2.thecatapi.com/images/8m9.jpg")
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFetchCatData_Failure() {
        MockURLProtocol.stubbedResponseError = NSError(domain: "NetworkError", code: 500, userInfo: nil)

        viewModel.fetchCatData()

        XCTAssertNil(viewModel.catImageURL)
        XCTAssertEqual(viewModel.errorMessage, "NetworkError")
        XCTAssertFalse(viewModel.isLoading)
    }

    func testFetchCatData_EmptyResponse() {
        MockURLProtocol.stubbedResponseData = Data()

        viewModel.fetchCatData()

        XCTAssertNil(viewModel.catImageURL)
        XCTAssertEqual(viewModel.errorMessage, "No data received")
        XCTAssertFalse(viewModel.isLoading)
    }

}
