//
//  MovieSearchProtocol.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation
import UIKit

protocol MovieSearchViewToPresenterProtocol {
    var view : MovieSearchPresenterToViewProtocol? {get set}
    var interactor : MovieSearchPresenterToInteractorProtocol? {get set}
    var router : MovieSearchPresenterToRouterProtocol? {get set}
    func fetchMovieSearchResults(withKeyword:String)
    func showMovieDetail(ofMovie : Movie, fromVC : UIViewController)
}

protocol MovieSearchPresenterToInteractorProtocol {
    var presenter : MovieSearchInteractorToPresenterProtocol? {get set}
    func getMovieSeachResults(withKeyword : String)
}

protocol MovieSearchInteractorToPresenterProtocol {
    func didFetchMovieSearchResult(searchResponse : [String:Any])
}

protocol MovieSearchPresenterToViewProtocol {
    func showSearchResults(withMovies : [Movie])
}

protocol MovieSearchPresenterToRouterProtocol {
    static func createMovieSearchModule(movieSearchRef : MovieSearchView)
    func pushToMovieDetail(ofMovie : Movie, fromVC : UIViewController)
}
