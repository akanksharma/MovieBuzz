//
//  MovieSearchPresenter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit

class MovieSearchPresenter: MovieSearchViewToPresenterProtocol {
    var router: MovieSearchPresenterToRouterProtocol?
    
   
    
    var view: MovieSearchPresenterToViewProtocol?
    
    var interactor: MovieSearchPresenterToInteractorProtocol?
    
    func fetchMovieSearchResults(withKeyword: String) {
        interactor?.getMovieSeachResults(withKeyword: withKeyword)
    }
    
    func showMovieDetail(ofMovie: Movie, fromVC: UIViewController) {
        router?.pushToMovieDetail(ofMovie: ofMovie, fromVC: fromVC)
    }
    
}

extension MovieSearchPresenter : MovieSearchInteractorToPresenterProtocol {
    func didFetchMovieSearchResult(searchResponse: [String : Any]) {
        var movieList = [Movie]()
        for (key,item)  in searchResponse {
            if key == "results"{
                let movieInfoArr : [[String:Any]] = item as! [[String:Any]]
                for movieInfo in movieInfoArr{
                    var attributes : [String:Any] = [String:Any]()
                    attributes["name"] = movieInfo["title"] as! String
                    attributes["movieId"] = movieInfo["id"] as! Int
                    if let posterPath  = movieInfo["poster_path"] as? String {
                        attributes["imageURL"] = (NetworkServiceManager.shared.movieImagePath) + posterPath
                    }
                    movieList.append(Movie.init(attributes: attributes))
                }
            }
        }
        view?.showSearchResults(withMovies: movieList)
    }
}
