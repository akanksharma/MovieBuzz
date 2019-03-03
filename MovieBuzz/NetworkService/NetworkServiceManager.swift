//
//  NetworkServiceManager.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 27/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class NetworkServiceManager: NSObject {
    static let shared = NetworkServiceManager()
    
    typealias RequestCompletionBlock = (_ data : [String:Any]?, _ error : Error?) -> Void
    
    public let movieImagePath = "https://image.tmdb.org/t/p/w500/"
    // 1
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?
    
    func request(url: String, parameters:[String:AnyObject]?, isSearchRequest:Bool = false, completion : @escaping RequestCompletionBlock)  {
        if isSearchRequest{
            dataTask?.cancel()
        }

        
        let urlSafeAddress = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        var request = URLRequest(url: URL(string: urlSafeAddress!)!)
        request.httpMethod = "GET"
        
        if parameters != nil {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters as Any, options: .prettyPrinted)
            } catch let err {
                print(err.localizedDescription)
            }
        }
        
        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200{
                print("Error in fetching data")
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any] {
                    completion(json, nil)
                }
                
            } catch let error {
                completion(nil,error)
            }
        }
        dataTask?.resume()
    }
}
