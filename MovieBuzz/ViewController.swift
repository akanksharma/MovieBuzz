//
//  ViewController.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let postData = NSData(data: "{}".data(using: String.Encoding.utf8)!)
        
        var request = NSMutableURLRequest(url: NSURL(string: "https://api.themoviedb.org/3/discover/movie?page=2&include_video=false&include_adult=false&sort_by=popularity.asc&language=en-US&api_key=78b16ae4147c7d6f435416a434d5c9d2")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

