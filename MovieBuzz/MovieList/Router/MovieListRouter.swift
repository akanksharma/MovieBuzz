//
//  MovieListRouter.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit

class MovieListRouter : MovieListPresenterToRouterProtocol{
    
    
    func pushToMovieDetail(withMovie: Movie, fromVC: UIViewController) {
        let movieDetailVC : MovieDetailView = fromVC.storyboard?.instantiateViewController(withIdentifier: "MovieDetailView") as! MovieDetailView
        MovieDetailRouter.createMovieDetailModel(movieDetailViewRef: movieDetailVC, withMovie: withMovie )
        fromVC.navigationController?.pushViewController(movieDetailVC, animated: true)
    }

    class func createMovieModule(movieViewRef : MovieListView){
        let presenter : MovieListInteractorToPresenterProtocol & MovieListViewToPresenterProtocol = MovieListPresenter()
//        movieViewRef.presenter?.router = MovieListRouter()
        movieViewRef.presenter = presenter
        movieViewRef.presenter?.router = MovieListRouter()
        movieViewRef.presenter?.view = movieViewRef
        movieViewRef.presenter?.interactor = MovieListInteractor()
        movieViewRef.presenter?.interactor?.presenter = presenter
    }
    
    
}
