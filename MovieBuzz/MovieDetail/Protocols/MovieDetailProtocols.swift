//
//  MovieDetailProtocols.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit


protocol MovieDetailViewToPresenterProtocol : class{
    var interactor : MovieDetailPresenterToInteractorProtocol? {get set}
    var view : MovieDetailPresenterToViewProtocol? {get set}
    var movie : Movie? {get set}
    func movieDetailViewDidLoad()
    func markFavoriteUnfavorite(movie : Movie?)
}

protocol MovieDetailPresenterToRouterProtocol : class{
    static func createMovieDetailModel(movieDetailViewRef :MovieDetailView, withMovie : Movie)
}

protocol MovieDetailPresenterToInteractorProtocol : class{
    var presenter : MovieDetailInteractorToPresenterProtocol? {get set}
    func getMovieDetail(withMovie : Movie?)
    func updateFavoriteStatus(movie : Movie?)
}

protocol MovieDetailInteractorToPresenterProtocol : class{
    func didFetchedMovieDetail(withMovieDetail : MovieDetail)
    func didUpdateFavFlag(favFlag : Bool)
}

protocol MovieDetailPresenterToViewProtocol : class{
    func showMovieDetail(movieDetail:MovieDetail)
    func updateFavStatus(favFlag : Bool)
}
