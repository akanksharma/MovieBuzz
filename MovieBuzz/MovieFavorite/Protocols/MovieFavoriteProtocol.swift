//
//  MovieFavoriteProtocol.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

protocol MovieFavoriteViewToPrsenterProtocol {
    var view : MovieFavoritePresenterToViewProtocol? {get set}
    var interactor : MovieFavoritePresenterToInteractorProtocol? {get set}
    
    
    func fetchFavoriteMovies()
    func unFavoriteMovie()
}

protocol MovieFavoritePresenterToInteractorProtocol {
    var presenter : MovieFavoriteInteractorToPresenterProtocol? {get set}
    func getFavoriteMovies()
    func updateMovieFavoriteFlag(movieId:Int)
}

protocol MovieFavoriteInteractorToPresenterProtocol {
    func didFetchFavoriteMovies(movies:[Movie])
    func didUpdateFavoriteFlag(movieId:Int)
}

protocol MovieFavoritePresenterToViewProtocol {
    func showFavoriteMovies(movies:[Movie])
    func refreshFavList()
}

protocol MovieFavoritePresenterToRouterProtocol {
    static func createMovieFavoriteViewModel(movieFavViewRef : MovieFavoriteView)
}
