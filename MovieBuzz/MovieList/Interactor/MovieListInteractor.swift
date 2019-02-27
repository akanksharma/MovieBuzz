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
        
        NetworkServiceManager.shared.request(url: "https://api.themoviedb.org/3/discover/movie?page=1&include_video=false&include_adult=false&sort_by=popularity.desc&language=en-US&api_key=78b16ae4147c7d6f435416a434d5c9d2", parameters: nil) { (response, error) in
            DispatchQueue.main.async {
                guard let responseJSON = response else {
                    return
                }
                var movieList = [Movie]()
                for (key,item)  in responseJSON {
                    if key == "results"{
                        let movieInfoArr : [[String:Any]] = item as! [[String:Any]]
                        for movieInfo in movieInfoArr{
                            movieList.append(Movie.init(attributes: ["name":movieInfo["title"] as! String,"imageURL": (NetworkServiceManager.shared.movieImagePath) + (movieInfo["poster_path"] as! String)]))
                        }
                     }
                }
                self.presenter?.movieListDidFetch(movieList: movieList)
            }
        }
        
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

