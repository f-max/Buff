//
//  ResponseValidatorTests.swift
//  ResponseValidatorTests

import XCTest
@testable import BuffSDK

class ResponseValidatorTests: XCTestCase {
    
    // MARK: - Happy paths
    
    func testResponseValidatorr_validResponse_producesCorrectResult() {
        let data = "some data".data(using: .utf8)
        let url = URL(string: "apple.com")!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let result = ResponseValidator.validate(data: data, response: response, error: nil)
        switch result {
        case .failure:
            XCTFail("validator didn't validate valid response")
        default:
            break
    }
}
    
    // MARK: - Unhappy paths
    
    func testResponseValidator_invalidResponse_badResponseCode_producesCorrectResult() {
        let data = "some data".data(using: .utf8)
        let url = URL(string: "apple.com")!
        let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)

        let result = ResponseValidator.validate(data: data, response: response, error: nil)
        switch result {
        case .success:
            XCTFail("validator validated invalid response")
        case .failure(let error):
            switch error {
            case .invalidResponse:
                break
            default:
                XCTFail("validator produced wrong error")
            }
        }
    }
    
    func testResponseValidator_invalidResponse_allParametersAreNil_producesCorrectResult() {
        let result = ResponseValidator.validate(data: nil, response: nil, error: nil)
        switch result {
        case .success:
            XCTFail("validator validated invalid response")
        case .failure(let error):
            switch error {
            case .invalidResponse:
                break
            default:
                XCTFail("validator produced wrong error")
            }
        }
    }
    
    // ...
}
