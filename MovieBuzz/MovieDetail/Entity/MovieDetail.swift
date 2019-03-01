//
//  MovieDetail.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

struct MovieDetail {
    var overview: String!
    var releaseDate : Date!
    var ratings : Float
    var genre : String
    var movie : Movie
    var cast : String!
    
    init(attributes : [String:Any]) {
        overview = attributes["overview"] as? String
        ratings = attributes["ratings"] as! Float
        releaseDate = attributes["ratings"] as? Date
        movie = attributes["movie"] as! Movie
        genre = attributes["genre"] as! String
        cast = attributes["cast"] as? String
    }
}
