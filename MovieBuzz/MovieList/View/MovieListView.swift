//
//  MovieListView.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 26/02/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import UIKit

class MovieListView: UIViewController, MovieListPresenterToViewProtocol {
    
    

    @IBOutlet weak var collectionViewMovies: UICollectionView!
    var moviesList: [Movie] = [Movie]()
    var presenter : MovieListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieListRouter.createModel(movieViewRef: self)
        presenter?.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func showMovieList(movies: [Movie]) {
        moviesList = movies
        collectionViewMovies.reloadData()
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

extension MovieListView : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(moviesList[indexPath.row].name)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}
