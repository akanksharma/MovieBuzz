//
//  MovieFavoriteView.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import UIKit

class MovieFavoriteView: UIViewController, MovieFavoritePresenterToViewProtocol{
    @IBOutlet weak var tableViewFavorite: UITableView!
    
    var favMovies : [Movie]?

    var presenter : MovieFavoriteViewToPrsenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieFavoriteRouter.createMovieFavoriteViewModel(movieFavViewRef: self)
        presenter?.fetchFavoriteMovies()
        // Do any additional setup after loading the view.
    }
    func showFavoriteMovies(movies: [Movie]) {
        favMovies = movies
    }
    
    func refreshFavList() {
        
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

extension MovieFavoriteView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cellFavMovie", for: indexPath)
        let labelMovieName : UILabel = cell.viewWithTag(1) as! UILabel
        labelMovieName.text = favMovies?[indexPath.row].name
        return cell
    }
    
    
}
