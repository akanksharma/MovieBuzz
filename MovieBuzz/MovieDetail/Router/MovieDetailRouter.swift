//
//  MovieDetailRouter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieDetailRouter {
    
    class func createMovieDetailModel(movieDetailViewRef :MovieDetailView, withMovie : Movie){
        let presenter : MovieDetailInteractorToPresenterProtocol & MovieDetailViewToPresenterProtocol = MovieDetailPresenter()
        movieDetailViewRef.presenter = presenter
        presenter.interactor = MovieDetailInteractor()
        presenter.view = movieDetailViewRef
        presenter.movie = withMovie
        presenter.interactor?.presenter = presenter
    }
    
    
}
