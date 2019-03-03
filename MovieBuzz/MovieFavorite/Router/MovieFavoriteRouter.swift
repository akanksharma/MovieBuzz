//
//  MovieFavoriteRouter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieFavoriteRouter: MovieFavoritePresenterToRouterProtocol {
    class func createMovieFavoriteViewModel(movieFavViewRef: MovieFavoriteView) {
        let presenter : MovieFavoriteInteractorToPresenterProtocol & MovieFavoriteViewToPrsenterProtocol = MovieFavoritePresenter()
        movieFavViewRef.presenter = presenter
        movieFavViewRef.presenter?.view = movieFavViewRef
        movieFavViewRef.presenter?.interactor = MovieFavoriteInteractor()
        movieFavViewRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
