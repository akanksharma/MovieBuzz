//
//  MovieListRouter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieListRouter {
    class func createModel(movieViewRef : MovieListView){
        let presenter : MovieListInteractorToPresenterProtocol & MovieListViewToPresenterProtocol = MovieListPresenter()
//        movieViewRef.presenter?.router = MovieListRouter()
        movieViewRef.presenter = presenter
        movieViewRef.presenter?.view = movieViewRef
        movieViewRef.presenter?.interactor = MovieListInteractor()
        movieViewRef.presenter?.interactor?.presenter = presenter
    }
}
