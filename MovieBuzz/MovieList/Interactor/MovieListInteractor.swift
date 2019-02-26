//
//  MovieListInteractor.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieListInteractor : MovieListPresenterToInteractorProtocol{
 
    weak var presenter : MovieListInteractorToPresenterProtocol?
    
    func getMovieList(){
        presenter?.movieListDidFetch(movieList: getAllMovies())
    }
    
    func getAllMovies() -> [Movie] {
        var movieList = [Movie]()
        let allMOview = generateDataList()
        for item in allMOview {
            movieList.append(Movie(attributes: item))
        }
        return movieList
    }
    
    func generateDataList() -> [[String: String]] {
        return [["name": "Orange","imageURL": "Vitain C"],["name": "Watermelon","imageURL": "Vitain A"], ["name": "Banana","imageURL": "Vitain B6"], ["name": "Apple","imageURL": "Vitain C"]]
    }
}

