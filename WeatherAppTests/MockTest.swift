//
//  MockTest.swift
//  WeatherAppTests
//
//  Created by Ranu Dhurandhar on 24/03/23.
//

import Foundation
@testable import WeatherApp

enum MockAPIResponsesTypes {
    case valid
    case invalid
    
    var fileName:String {
        switch self {
        case .valid:
            return Constant.localDataFileName
        case .invalid:
            return Constant.failedMockedFile
        }
    }
}

protocol MockServicesProtocol {
    func getWeatherdata(responseType: MockAPIResponsesTypes, completion: @escaping ([Weather]?) -> Void)
}

class MockTest:MockServicesProtocol {
    func getWeatherdata(responseType: MockAPIResponsesTypes, completion: @escaping ([Weather]?) -> Void) {
        print(responseType)
        if(responseType == .valid){
        guard let result = [Weather].parse(jsonFile: Constant.localDataFileName) else {
            completion(nil)
           return
        }
        completion(result)
    }else{
        guard let result = [Weather].parse(jsonFile: Constant.failedMockedFile) else {
            completion(nil)
           return
        }
        completion(result)
    }
  }
}
