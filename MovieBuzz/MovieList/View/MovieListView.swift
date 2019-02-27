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
    var isPageRefreshing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieListRouter.createModel(movieViewRef: self)
        presenter?.viewDidLoad()
        imageCache.removeAllObjects()
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

extension MovieListView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(moviesList[indexPath.row].name)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath)
        let imageView: UIImageView = cell.viewWithTag(1) as! UIImageView
        let title: UILabel = cell.viewWithTag(2) as! UILabel
        title.text = moviesList[indexPath.row].name
        imageView.loadImageUsingUrlString(urlString: moviesList[indexPath.row].imageURL)
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (K_SCREEN_WIDTH - 40)/2, height: (K_SCREEN_WIDTH - 40)/2 + 30)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(self.collectionViewMovies.contentOffset.y >= (self.collectionViewMovies.contentSize.height - self.collectionViewMovies.bounds.size.height)) {
            if(isPageRefreshing==false) {
                isPageRefreshing=true
            }
        }
    }
    
}

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    
    func loadImageUsingUrlString(urlString: String) {
        var imageUrlString: String?
        imageUrlString = urlString
        
        let url = NSURL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                
                if imageUrlString == urlString {
                    self.image = imageToCache?.resizeImage(targetSize: CGSize.init(width: (K_SCREEN_WIDTH - 40)/2, height: (K_SCREEN_WIDTH - 40)/2))
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
            
           
            
        }).resume()
    }

    
}

extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
