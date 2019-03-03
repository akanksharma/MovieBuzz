//
//  MovieSearchView.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 03/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import UIKit

class MovieSearchView: UIViewController, MovieSearchPresenterToViewProtocol {
    
    @IBOutlet weak var labelMovieSearch: UILabel!
    var arrMovie : [Movie]?
    @IBOutlet weak var tableViewSearchResult: UITableView!
    
    var presenter : MovieSearchViewToPresenterProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieSearchRouter.createMovieSearchModule(movieSearchRef: self)
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here"
        search.searchBar.tintColor = UIColor.white
        search.searchBar.barTintColor = UIColor.white
        navigationItem.searchController = search
        search.searchBar.barStyle = .default
        search.isActive = true
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        search.searchBar.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 11.0, *) {
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    func showSearchResults(withMovies: [Movie]) {
        arrMovie = withMovies
        tableViewSearchResult.reloadData()
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

extension MovieSearchView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = arrMovie {
            if movies.count == 0 {
                labelMovieSearch.isHidden = false
            } else {
                labelMovieSearch.isHidden = true
            }
            return movies.count
        } else {
            labelMovieSearch.isHidden = true
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearchResult", for: indexPath)
        let labelMovieName : UILabel = cell.viewWithTag(1) as! UILabel
        labelMovieName.text = arrMovie?[indexPath.row].name
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showMovieDetail(ofMovie: arrMovie![indexPath.row], fromVC: self)
    }
    
    
}
extension MovieSearchView : UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        if text != ""{
            presenter.fetchMovieSearchResults(withKeyword: text)
        }
    }
}
