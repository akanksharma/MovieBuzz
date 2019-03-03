//
//  MovieDetailView.swift
//  MovieBuzz
//
//  Created by Akanksha Sharma on 01/03/19.
//  Copyright © 2019 Akanksha Sharma. All rights reserved.
//

import UIKit

class MovieDetailView: UIViewController , MovieDetailPresenterToViewProtocol{
    
    
    
    @IBOutlet weak var bgImagePoster: UIImageView!
    
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var labelRatings: UILabel!
    @IBOutlet weak var imagePoster: UIImageView!
    
    @IBOutlet weak var labelGenre: UILabel!
    @IBOutlet weak var labelReleaseDate: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCast: UILabel!
    @IBOutlet weak var labelOverview: UILabel!
    
    var movieDetail : MovieDetail?
    var presenter : MovieDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        presenter?.movieDetailViewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showMovieDetail(movieDetail: MovieDetail) {
        self.movieDetail = movieDetail
        labelTitle.text = movieDetail.movie.name
       
        if movieDetail.overview != nil {
            labelOverview.text = movieDetail.overview
        }
        if movieDetail.releaseDate != nil {
            let dateFormatter : DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            labelReleaseDate.text = "Release Year : " + dateFormatter.string(from: movieDetail.releaseDate)
        }
        if movieDetail.backdropPath != nil {
            imagePoster.loadImageUsingUrlString(urlString: movieDetail.backdropPath)
        } else {
            imagePoster.image = UIImage(named: "not-available")
        }
        if movieDetail.movie.imageURL != nil {
            bgImagePoster.loadImageUsingUrlString(urlString: movieDetail.movie.imageURL)
        }

        if movieDetail.genre != nil {
            labelGenre.text = "Genre : " + movieDetail.genre
        }
        if movieDetail.cast != nil {
            labelCast.text = "Cast : " +  movieDetail.cast
        }
        if movieDetail.ratings != nil {
            labelRatings.text = "Ratings : \(movieDetail.ratings ?? 1.0)/5"
        }

        buttonFavorite.isSelected = movieDetail.isFavorite
    }
    
    @IBAction func buttonFavoriteClicked(_ sender: Any) {
        if movieDetail != nil {
           presenter?.markFavoriteUnfavorite(movie: movieDetail?.movie)
        }
    }
    
    func updateFavStatus(favFlag: Bool) {
        buttonFavorite.isSelected = favFlag
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
