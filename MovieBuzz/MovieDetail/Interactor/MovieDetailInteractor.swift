//
//  MovieDetailInteractot.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieDetailInteractor: MovieDetailPresenterToInteractorProtocol {
    
    
    
    
    var presenter: MovieDetailInteractorToPresenterProtocol?
    var movieDetailResponse : [String:Any]?
    
    var movieCastResponse : [String:Any]?
    
    func getMovieDetail(withMovie : Movie?) {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getMovieDetail(movieID: String(withMovie?.movieId ?? 0), completion: {
            dispatchGroup.leave()
            
        })
        
        dispatchGroup.enter()
        getMovieCast(movieID: String(withMovie?.movieId ?? 0), completion: {
            dispatchGroup.leave()

        })
        dispatchGroup.notify(queue: .main) {
            print("all activities complete 👍")
            var movieDetailAttributes : [String:Any] = [String:Any]()
            movieDetailAttributes["overview"] = self.movieDetailResponse?["overview"] as! String
            let castArr : [[String:Any]] = self.movieCastResponse?["cast"] as! [[String:Any]]
            var castString = ""
            for cast in castArr.prefix(5){
                castString = castString + "," + (cast["name"] as! String)
            }
            castString.removeFirst()
            movieDetailAttributes["cast"] = castString
            movieDetailAttributes["movie"] = withMovie
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
            movieDetailAttributes["releaseDate"] = dateFormatter.date(from: self.movieDetailResponse?["release_date"] as! String)
            let genreArray : [[String:Any]] = self.movieDetailResponse?["genres"] as! [[String:Any]]
            var genreString = ""
            for genre in genreArray {
                genreString = genreString + (genre["name"] as! String) + ","
            }
            genreString.removeLast()
            movieDetailAttributes["genre"] = genreString
            if let rating = self.movieDetailResponse?["vote_average"] as? NSNumber {
                movieDetailAttributes["ratings"] = rating.floatValue/2.0

            }
            
            movieDetailAttributes["isFavorite"] = DBServiceManager.shared.checkFavoriteStatusForMovie(movieID: (withMovie?.movieId))
            movieDetailAttributes["backdropPath"] = "https://image.tmdb.org/t/p/original/" + (self.movieDetailResponse?["backdrop_path"] as! String)
            

            print(castString)
            self.presenter?.didFetchedMovieDetail(withMovieDetail: MovieDetail(attributes: movieDetailAttributes))
        }
        
        
        
    }
    
    func getMovieDetail(movieID : String,completion : @escaping() -> Void){
        
        let urlString = "https://api.themoviedb.org/3/movie/" + movieID + "?api_key=78b16ae4147c7d6f435416a434d5c9d2&language=en-US"
        NetworkServiceManager.shared.request(url: urlString, parameters: nil) { (response, error) in
            
            DispatchQueue.main.async {
                guard let responseJSON = response else {
                    return
                }
                self.movieDetailResponse = responseJSON
                completion()
            }
        }
    }
    func getMovieCast(movieID : String,completion : @escaping() -> Void){
        let urlString = "https://api.themoviedb.org/3/movie/" + movieID + "/credits?api_key=78b16ae4147c7d6f435416a434d5c9d2&language=en-US"
        NetworkServiceManager.shared.request(url: urlString, parameters: nil) { (response, error) in
            
            DispatchQueue.main.async {
                guard let responseJSON = response else {
                    return
                }
                self.movieCastResponse = responseJSON
                completion()
                
            }
        }
    }
    
    func updateFavoriteStatus(movie: Movie?) {
        presenter?.didUpdateFavFlag(favFlag: DBServiceManager.shared.saveMovieAsFavorite(movieId: movie?.movieId, movieName: movie?.name))
    }
}
