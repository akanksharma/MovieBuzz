//
//  MovieListPresenter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit

class MovieListPresenter : MovieListViewToPresenterProtocol{
    
    
    
    var pageNumber: Int?
    
    var totalMovies: Int?
    
    var router: MovieListPresenterToRouterProtocol?
    
    var view : MovieListPresenterToViewProtocol?
    var interactor : MovieListPresenterToInteractorProtocol?
    
    func viewDidLoad(){
        interactor?.getMovieList(withPageNumber: pageNumber)
    }
    func fetchMovies(withPageNumber: Int) {
        self.pageNumber = (self.pageNumber ?? 0) + 1
        interactor?.getMovieList(withPageNumber: pageNumber)
    }
    
    func showMovieDetail(ofMovie: Movie, fromVC: UIViewController) {
        router?.pushToMovieDetail(withMovie: ofMovie, fromVC: fromVC)
    }
}

extension MovieListPresenter : MovieListInteractorToPresenterProtocol{
    func movieListDidFetch(movieListResponse : [String:Any]){
        var movieList = [Movie]()
        for (key,item)  in movieListResponse {
            if key == "results"{
                let movieInfoArr : [[String:Any]] = item as! [[String:Any]]
                for movieInfo in movieInfoArr{
                    movieList.append(Movie.init(attributes: ["name":movieInfo["title"] as! String,"movieId":movieInfo["id"] as! Int ,"imageURL": (NetworkServiceManager.shared.movieImagePath) + (movieInfo["poster_path"] as! String)]))
                }
            }
            if key == "page"{
                self.pageNumber = item as? Int
            }
        }
        view?.showMovieList(movies: movieList)
    }
}
