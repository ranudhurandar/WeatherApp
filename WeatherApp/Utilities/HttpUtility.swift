//
//  HttpUtility.swift
//  WeatherApp
//
//  Created by Ranu Dhurandhar on 04/04/23.
//

import Foundation

struct HttpUtility
{
    func getApiData<T: Decodable>(requestUrl: URL, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void){
        
         URLSession.shared.dataTask(with: requestUrl) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0){
                let decoder = JSONDecoder()
                do{
                    let result = try decoder.decode(T.self, from: responseData!)
                    _ = completionHandler(result)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
            
        }.resume()
        
    }
    
    
    func postApiData<T: Decodable>(requestUrl: URL, requestBody: Data, requestType: T.Type, completionHandler:@escaping(_ result: T)-> Void){
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "post"
        urlRequest.httpBody = requestBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        
        let task =  URLSession.shared.dataTask(with: urlRequest, completionHandler: {(data, httpUrlResponse, error) in
            if(data != nil && data?.count != 0){
                do{
                    let response =  try JSONDecoder().decode(T.self, from: data!)
                    _=completionHandler(response)
                }
                catch let decodingError{
                    debugPrint(decodingError)
                }
            }
        })
        task.resume()
        
    }   
    
}

