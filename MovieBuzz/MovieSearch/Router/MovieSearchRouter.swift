//
//  MovieSearchRouter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit


class MovieSearchRouter: MovieSearchPresenterToRouterProtocol {
    func pushToMovieDetail(ofMovie: Movie, fromVC: UIViewController) {
        let movieDetailVC : MovieDetailView = fromVC.storyboard?.instantiateViewController(withIdentifier: "MovieDetailView") as! MovieDetailView
        MovieDetailRouter.createMovieDetailModel(movieDetailViewRef: movieDetailVC, withMovie: ofMovie )
        fromVC.navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    
    class func createMovieSearchModule(movieSearchRef: MovieSearchView) {
        let presenter : MovieSearchViewToPresenterProtocol & MovieSearchInteractorToPresenterProtocol = MovieSearchPresenter()
        movieSearchRef.presenter = presenter
        movieSearchRef.presenter.view = movieSearchRef
        movieSearchRef.presenter.router = MovieSearchRouter()
        movieSearchRef.presenter.interactor = MovieSearchInteractor()
        movieSearchRef.presenter.interactor?.presenter = presenter
    }
    
    
}
