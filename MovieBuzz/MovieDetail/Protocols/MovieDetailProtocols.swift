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
}

protocol MovieDetailPresenterToRouterProtocol : class{
    static func createMovieDetailModel(movieDetailViewRef :MovieDetailView, withMovie : Movie)
}

protocol MovieDetailPresenterToInteractorProtocol : class{
    var presenter : MovieDetailInteractorToPresenterProtocol? {get set}
    func getMovieDetail(withMovie : Movie?)
}

protocol MovieDetailInteractorToPresenterProtocol : class{
    func didFetchedMovieDetail(withMovieDetail : MovieDetail)
}

protocol MovieDetailPresenterToViewProtocol : class{
    func showMovieDetail(movieDetail:MovieDetail)
}
