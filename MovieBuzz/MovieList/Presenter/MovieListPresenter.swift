//
//  MovieListPresenter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieListPresenter : MovieListViewToPresenterProtocol{
    var router: MovieListPresenterToRouterProtocol?
    
    var view : MovieListPresenterToViewProtocol?
    var interactor : MovieListPresenterToInteractorProtocol?
    
    func viewDidLoad(){
        interactor?.getMovieList()
    }
}

extension MovieListPresenter : MovieListInteractorToPresenterProtocol{
    func movieListDidFetch(movieList: [Movie]) {
        view?.showMovieList(movies: movieList)
    }
}
