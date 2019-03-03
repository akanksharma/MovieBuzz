//
//  MovieFavoritePresenter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieFavoritePresenter: MovieFavoriteViewToPrsenterProtocol {
    var view: MovieFavoritePresenterToViewProtocol?
    
    var interactor: MovieFavoritePresenterToInteractorProtocol?
    
    
    
    func fetchFavoriteMovies() {
        interactor?.getFavoriteMovies()
    }
    
    func unFavoriteMovie() {
        
    }
    
    
    
}


extension MovieFavoritePresenter : MovieFavoriteInteractorToPresenterProtocol{
    func didFetchFavoriteMovies(movies: [Movie]) {
        view?.showFavoriteMovies(movies: movies)
    }
    
    func didUpdateFavoriteFlag(movieId: Int) {
        
    }
    
    
}
