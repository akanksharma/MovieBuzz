//
//  Movie.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

struct Movie {
    var name:String!
    var imageURL : String!
    var movieId : Int!
    
    init(attributes:[String:Any]) {
        name = attributes["name"] as? String
        imageURL = attributes["imageURL"] as? String
        movieId = attributes["movieId"] as? Int
    }
    
}
