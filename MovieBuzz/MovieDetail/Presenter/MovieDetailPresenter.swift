//
//  MovieDetailPresenter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailPresenter: MovieDetailViewToPresenterProtocol {
    var movie: Movie?
    var interactor: MovieDetailPresenterToInteractorProtocol?
    
    var view: MovieDetailPresenterToViewProtocol?
    

    func movieDetailViewDidLoad() {
        interactor?.getMovieDetail(withMovie: movie)
    }
    
    
}

extension MovieDetailPresenter : MovieDetailInteractorToPresenterProtocol{
    func didFetchedMovieDetail(withMovieDetail: MovieDetail) {
        view?.showMovieDetail(movieDetail: withMovieDetail)
    }
}
