//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by Ranu Dhurandhar on 17/03/23.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {

    var mockServices: MockTest?
    
    override func setUp() {
        mockServices = MockTest()
    }
    
    override func tearDown() {
         mockServices = nil
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
     
    func testMockData(){
        
        mockServices?.getWeatherdata(responseType: .valid, completion: {result in
            XCTAssertNotNil(result, "Success")
        })
    }
    
    func testMockData_failed(){
                mockServices?.getWeatherdata(responseType: .invalid, completion: {result in
                    XCTAssertNil(result, "Failure")
        
                })
    }

}
