//
//  MovieFavoriteInteractor.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieFavoriteInteractor: MovieFavoritePresenterToInteractorProtocol {
    var presenter: MovieFavoriteInteractorToPresenterProtocol?
    
    
    func getFavoriteMovies() {
        presenter?.didFetchFavoriteMovies(movies:DBServiceManager.shared.fetchFavoriteMovies())
        
    }
    
    func updateMovieFavoriteFlag(movieId: Int) {
        DBServiceManager.shared.saveMovieAsFavorite(movieId: movieId, movieName: "")
        presenter?.didUpdateFavoriteFlag(movieId: movieId)
    }
    
    
}
