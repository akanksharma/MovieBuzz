//
//  MovieSearchInteractor.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import Foundation

class MovieSearchInteractor : MovieSearchPresenterToInteractorProtocol{
    var presenter: MovieSearchInteractorToPresenterProtocol?
    
    func getMovieSeachResults(withKeyword: String) {
        
        
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=78b16ae4147c7d6f435416a434d5c9d2&language=en-US&query=" + withKeyword + "&page=1&include_adult=false"
        NetworkServiceManager.shared.request(url: urlString,parameters: nil, isSearchRequest:true) { (response, error) in
            DispatchQueue.main.async {
                guard let responseJSON = response else {
                    return
                }
            self.presenter?.didFetchMovieSearchResult(searchResponse: responseJSON)
                
            }
        }
    }
    
    
}
