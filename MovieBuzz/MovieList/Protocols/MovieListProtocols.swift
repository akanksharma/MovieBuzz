//
//  MovieListProtocols.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation


//Presenter -> Router
protocol MovieListPresenterToRouterProtocol : class{
    static func createMovieModule(view : MovieListView)
}

//View -> Presenter
protocol MovieListViewToPresenterProtocol : class{
    
    var interactor : MovieListPresenterToInteractorProtocol? {get set}
    var router : MovieListPresenterToRouterProtocol? {get set}
    var view : MovieListPresenterToViewProtocol? {get set}
    var pageNumber : Int? {get set}
    var totalMovies : Int? {get set}
    func fetchMovies(withPageNumber : Int)
    func viewDidLoad()
}

//Presenter -> Interactor
protocol MovieListPresenterToInteractorProtocol : class{
    var presenter:MovieListInteractorToPresenterProtocol? {get set}
    func getMovieList(withPageNumber : Int?)
}

//Interactor -> Presenter
protocol MovieListInteractorToPresenterProtocol : class{
//    func movieListDidFetch(movieList : [Movie])
    func movieListDidFetch(movieListResponse : [String:Any])
}

//Presenter -> View
protocol MovieListPresenterToViewProtocol : class{
    func showMovieList(movies : [Movie])
}
