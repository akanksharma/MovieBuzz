//
//  MovieDetailView.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import UIKit

class MovieDetailView: UIViewController , MovieDetailPresenterToViewProtocol{
    
    

    
    var movieDetail : MovieDetail?
    var presenter : MovieDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        presenter?.movieDetailViewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showMovieDetail(movieDetail: MovieDetail) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
