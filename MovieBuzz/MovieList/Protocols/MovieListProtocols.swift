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
    func viewDidLoad()
}

//Presenter -> Interactor
protocol MovieListPresenterToInteractorProtocol : class{
    var presenter:MovieListInteractorToPresenterProtocol? {get set}
    func getMovieList()
}

//Interactor -> Presenter
protocol MovieListInteractorToPresenterProtocol : class{
    func movieListDidFetch(movieList : [Movie])
}

//Presenter -> View
protocol MovieListPresenterToViewProtocol : class{
    func showMovieList(movies : [Movie])
}