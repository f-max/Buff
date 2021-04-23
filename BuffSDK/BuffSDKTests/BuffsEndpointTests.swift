//
//  EndpointTests.swift

import XCTest
@testable import BuffSDK

class BuffsEndpointTests: XCTestCase {

    func testBuffsEndpoint_requiresAuthentiBuffsion() {
        let endpoint = BuffEndpoint(buffId: 1)
        XCTAssertFalse(endpoint.requiresAuthentication)
    }
    
    func testURLRequest_withBuffsEndpoint_producesCorrectRequest() {
        let request = URLRequest.request(endpoint: BuffEndpoint(buffId: 1))
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.url?.absoluteString, "https://demo2373134.mockable.io/buffs/1")
        XCTAssertEqual(request.allHTTPHeaderFields, [:])
        XCTAssertNil(request.httpBody)
    }
    
}
