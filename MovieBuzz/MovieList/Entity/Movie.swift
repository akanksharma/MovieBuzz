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
    
    init(attributes:[String:String]) {
        name = attributes["name"]
        imageURL = attributes["imageURL"]
    }
    
}
