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
    var ratings : Float!
    var genre : String!
    var movie : Movie!
    var cast : String!
    var backdropPath : String!
    var isFavorite : Bool!

    
    init(attributes : [String:Any]) {
        isFavorite = attributes["isFavorite"] as? Bool
        overview = attributes["overview"] as? String
        ratings = attributes["ratings"] as? Float
        releaseDate = attributes["releaseDate"] as? Date
        movie = attributes["movie"] as? Movie
        genre = attributes["genre"] as? String
        cast = attributes["cast"] as? String
        backdropPath = attributes["backdropPath"] as? String
    }
}
